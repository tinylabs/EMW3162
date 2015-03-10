title="Build menu
prompt="Pick an option:"
options=("Make WICED SDK" "Clean WICED SDK" "Build audioshield project"  "Clean audioshield project")
playfromudp=

while opt=$(zenity --width 309 --height 240 --title="$title" --text="$prompt" --list \
                   --column="Options" "${options[@]}"); do
 case $opt in
    "${options[0]}" ) 
        pid="./WICED_SRC/make -C ./WICED_SRC/ EMW3162-FreeRTOS-LwIP"
        exec $pid &
        ;;
    "${options[1]}") 
		pid="make -C ./WICED_SRC clean"
		exec $pid &
        ;;
    "${options[2]}") 
		pid="make -C ./projects/audioshield_ap"
        exec $pid &
        ;;
   "${options[3]}") 
		pid="make -C ./projects/audioshield_ap clean"
		exec $pid &
        ;;
    "${options[-1]}") 
        zenity --error --text="Invalid option. Try another one.."
        ;;
    esac

done
