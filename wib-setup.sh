#!/usr/bin/env bash


if [ -e /bin/usr/gdrive ]; then
	echo "Installed gdrive"
fi
if [ ! -e /bin/usr/gdrive ]; then
	echo "Installing gdrive..."
	# gdriveをインストールする
	wget "https://docs.google.com/uc?id=0B3X9GlR6EmbnQ0FtZmJJUXEyRTA&export=download" -O /usr/bin/gdrive

	# 

fi

#wget "https://docs.google.com/uc?id=0B3X9GlR6EmbnQ0FtZmJJUXEyRTA&export=download" -O /usr/bin/gdrive