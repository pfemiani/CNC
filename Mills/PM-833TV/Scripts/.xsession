xrdb -merge ~/.Xresources

ratpoison &
while true; do
	/usr/bin/linuxcnc '/home/cnc-mill/linuxcnc/configs/Femiani_CNC_PM-833TV/PM-833TV.ini' & pid=$!
	wait $pid
	echo Femiani01 | sudo -S shutdown -h now
done

