#!/bin/sh
# Usage: rotate-save.sh <degrees> <file>
# Rotate the current imv image clockwise by <degrees> (90/180/270):
#   1. Rotate the on-screen image instantly via imv-msg (no re-decode).
#   2. Persist to disk in the background, PRESERVING the file's mtime.
#
# Why preserve mtime: imv polls the current file's mtime once per second and
# reloads it if it grew. A reload keeps the in-memory rotation from step 1 and
# re-applies it on top of the already-rotated file on disk, rotating it twice.
# Navigation (next/prev) resets imv's view transform, so after moving away and
# back the persisted, already-rotated file on disk is shown correctly.
#
# The working file is created under /tmp. Note: if /tmp is on a different
# filesystem than the image (e.g. tmpfs vs your disk), the final move is a
# cross-filesystem copy, not an atomic rename.

deg="${1:-90}"
f="$2"
[ -n "$f" ] || exit 1

ext="${f##*.}"
tmp=$(mktemp "/tmp/imv-rotate.XXXXXX.$ext") || exit 1

# 1. Instant on-screen rotation (fire-and-forget IPC: returns even though imv is
#    blocked in the system() that launched this script). Only when we rotate the
#    view do we need to suppress imv's reload by preserving mtime; without IPC we
#    let mtime bump so imv reloads and shows the change.
if [ -n "$imv_pid" ]; then
	imv-msg "$imv_pid" rotate by "$deg" && preserve=1
fi

# 2. Persist to disk, detached so this script returns instantly.
save() {
	# Capture the original mtime (epoch seconds) before we overwrite the file.
	omt=$(stat -c %Y "$f" 2>/dev/null)
	case "$f" in
		*.jpg|*.jpeg|*.JPG|*.JPEG)
			jpegtran -rotate "$deg" -copy all -outfile "$tmp" "$f" || { rm -f "$tmp"; return 1; }
			;;
		*)
			magick "$f" -rotate "$deg" "$tmp" || { rm -f "$tmp"; return 1; }
			;;
	esac
	mv -f "$tmp" "$f" || { rm -f "$tmp"; return 1; }
	# Restore the original mtime so imv's mtime poll doesn't reload (and double).
	[ -n "$preserve" ] && [ -n "$omt" ] && touch -d "@$omt" "$f"
}
save >/dev/null 2>&1 </dev/null &
