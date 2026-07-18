#!/bin/bash
# Get current brightness (assuming brightnessctl is used)
current=$(brightnessctl g)
max=$(brightnessctl m)
# Calculate percentage
perc=$((current * 100 / max))

# Show a simple slider
new_val=$(zenity --scale --text="Adjust Brightness" --min-value=1 --max-value=100 --value="$perc" --step=5)

# Apply the new brightness if user clicked OK
if [ $? -eq 0 ]; then
    brightnessctl s "$new_val"%
fi
