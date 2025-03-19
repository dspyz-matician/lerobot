sudo cp 99-fixed-interbotix-udev.rules /etc/udev/rules.d/
sudo udevadm control --reload && sudo udevadm trigger
