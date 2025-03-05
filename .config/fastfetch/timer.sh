
# Define the two time strings
time4="12/12/2024 9:30PM"
let current=$(date +%s)

# Convert the time strings to Unix timestamps
timestamp4=$(date -d "$time4" +%s)

# Calculate the time difference in seconds
gnome_progression=$((current - timestamp4))
# Convert the time difference to days (86400 seconds in a day)
gnome_done=$((gnome_progression/ 86400))

echo $theme_done
echo $days_difference

