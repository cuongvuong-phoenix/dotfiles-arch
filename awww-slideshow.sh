#!/bin/bash

# --- Configuration ---
WALLPAPER_DIR="/mnt/SSD/Media/Images/_Wallpapers/Linux"

VALID_EXTENSIONS=("jpg" "jpeg" "png" "webp")
for ext in "${VALID_EXTENSIONS[@]}"; do
    # Prepend '-e ' and append to the new array
    MAPPED_EXTENSIONS+=("-e $ext")
done

DELAY="30m"

# --- Run ---
populate_wallpapers() {
    # NOTE: Don't double-quote `"${MAPPED_EXTENSIONS[@]}"`because it will treat the entire
    # `-e ... -e ...` as a single argument
    mapfile -t WALLPAPERS < <(fd ${MAPPED_EXTENSIONS[@]} . "$WALLPAPER_DIR")
}
populate_wallpapers

# Start an infinite loop
while true; do
    # Check if the WALLPAPERS is empty (cycle complete)
    if [ ${#WALLPAPERS[@]} -eq 0 ]; then
        echo "[INFO] Cycle completed. Refilling wallpaper list."
        populate_wallpapers
    fi

    # Check again in case the directory is empty
    if [ ${#WALLPAPERS[@]} -eq 0 ]; then
        echo "[ERROR] No image files found in '$WALLPAPER_DIR' with extensions: ${VALID_EXTENSIONS[@]}." >&2
        exit 1
    fi

    # Select a random wallpaper from the array
    WALLPAPER_INDEX=$(( RANDOM % ${#WALLPAPERS[@]} ))
    SELECTED_WALLPAPER="${WALLPAPERS[$WALLPAPER_INDEX]}"

    # Update the wallpaper
    echo "[INFO] Setting wallpaper: '$SELECTED_WALLPAPER'"
    awww img "$SELECTED_WALLPAPER"

    # Remove the selected wallpaper from the array to prevent duplication within this cycle
    unset "WALLPAPERS[$WALLPAPER_INDEX]"
    # Re-index the array after using unset to keep the indices contiguous
    WALLPAPERS=("${wallpapers[@]}")

    # Delay before selecting the next wallpaper
    sleep $DELAY
done
