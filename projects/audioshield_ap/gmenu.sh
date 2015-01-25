title="Gstreamer menu"
prompt="Pick an option:"
options=("Start UDP Listen" "Receive UDP to dump.bin" "Play Silence"  "Play dump.bin" "Reroute udp" "Kill Gstreamer")
playfromudp=

while opt=$(zenity --width 309 --height 300 --title="$title" --text="$prompt" --list \
                   --column="Options" "${options[@]}"); do
 case $opt in
    "${options[0]}" ) 
        pid="gst-launch udpsrc uri=\"udp://192.168.0.2:50007\" buffer-size=0 ! audioparse rate=22050 signed=true width=16 depth=16 format=int channels=1 ! alsasink sync=false"
        echo $pid
        exec $pid &
        ;;
    "${options[1]}") 
		pid="gst-launch udpsrc uri=\"udp://192.168.0.2:50007\" buffer-size=200000 ! audioparse rate=22050 signed=true width=16 depth=16 format=int channels=1 ! filesink location=dump.bin"
		echo $pid
		exec $pid &
        ;;
    "${options[2]}") 
		pid="gst-launch filesrc blocksize=800 location=silence.bin ! audioparse rate=22050 signed=false width=16 depth=16 format=int channels=1 ! udpsink host=192.168.0.1 port=50007"
        echo $pid
        exec $pid &
        ;;
   "${options[3]}") 
		pid="gst-launch filesrc blocksize=800 location=dump.bin ! audioparse rate=22050 signed=false width=16 depth=16 format=int channels=1 ! udpsink host=192.168.0.1 port=50007"
        echo $pid
        exec $pid &
        ;;
   "${options[4]}") 
		pid="gst-launch udpsrc uri=\"udp://192.168.0.2:50007\" buffer-size=0 ! audioparse rate=22050 signed=false width=16 depth=16 format=int channels=1 ! udpsink blocksize=20 host=192.168.0.1 port=50007"
        echo $pid
        exec $pid &
        ;;
   "${options[5]}") 
		pkill gst-launch
        ;;
    "${options[-1]}") 
        zenity --error --text="Invalid option. Try another one.."
        ;;
    esac

done
