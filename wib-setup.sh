#!/usr/bin/env bash


if [ -e /bin/usr/gdrive ]; then
	echo "Installed gdrive"
else
function ConfirmExecution() {

  echo "gdriveをインストールしますか?"
  echo "  yes または no と入力して下さい."
  read input

  if [ -z $input ] ; then

    echo "  yes または no を入力して下さい."
    ConfirmExecution

  elif [ $input = 'yes' ] || [ $input = 'YES' ] || [ $input = 'y' ] ; then

    echo "  インストール中."
	# gdriveをインストールする
	wget "https://docs.google.com/uc?id=0B3X9GlR6EmbnQ0FtZmJJUXEyRTA&export=download" -O /usr/bin/gdrive

  elif [ $input = 'no' ] || [ $input = 'NO' ] || [ $input = 'n' ] ; then

    echo "  インストールを中断します."
    exit 1

  else

    echo "  yes または no を入力して下さい."
    ConfirmExecution

  fi

}
    ConfirmExecution

    echo "done"
fi