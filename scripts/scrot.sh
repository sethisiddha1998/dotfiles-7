#!/bin/sh
# Take a screenshot, crop out the secondary monitors
# and upload it to sr.ht
#
# Created by Dylan Araps
# https://github.com/dylanaraps/dotfiles

upload () {
    file="$1"
    dest="https://sr.ht/api/upload"

    # Upload the image, to use this script you'll need your sr.ht key.
    curl --silent -F key="$(cat srhtkey)" -F file="@${file}" "https://sr.ht/api/upload" | grep -o -i "https://sr.ht/*.[a-z0-9._-]*"
}

# If args are given, take a screenshot and upload it
# else upload $1
if [ -z "$1" ]; then
    # What to name the image and where to save it
    img="scrot-$(date "+%d%b")-$RANDOM.png"
    dir="$HOME/Pictures/"

    # Take the screenshot and move the image to $dir
    scrot -q 100 "$img" -e "mv $img $dir"

    # Crop out the surrounding monitors
    convert -crop 1920x1080+0+0 "$dir/$img" "$dir/$img"

    # Upload the image to mixtape.moe
    upload "$dir/$img"
else
    upload "$1"
fi
