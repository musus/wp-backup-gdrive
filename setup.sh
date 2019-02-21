#!/usr/bin/env bash


if [ -e /bin/usr/gdrive ]; then

	echo "Installed gdrive - すでにgdriveがインストールされています."

else

function MakeDir() {
    echo "バックアップ用のフォルダをGoogle Driveに作成しますか？"
    echo "  yes または no と入力して下さい."
    read inputMakeDir

    if [ -z $inputMakeDir ]; then

        echo "  yes または no を入力して下さい."
        MakeDir

    elif [ $inputMakeDir = 'yes' ] || [ $inputMakeDir = 'YES' ] || [ $inputMakeDir = 'y' ] ; then

        gdrive mkdir "wp_backups"

    elif [ $inputMakeDir = 'no' ] || [ $inputMakeDir = 'NO' ] || [ $inputMakeDir = 'n' ] ; then

        echo "フォルダの作成を中止しました"

    else

        echo "  yes または no を入力して下さい."
        MakeDir

    fi


}

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
    MakeDir
    exit 1

  else

    echo "  yes または no を入力して下さい."
    ConfirmExecution

  fi

}
    ConfirmExecution

    echo "done"

    # change ownership
    sudo chown user /usr/bin/gdrive

    # change mod
    sudo chmod 755 /usr/bin/gdrive

    # authenitication for Google
    echo "下記URLにアクセスしGoogleアカウントを認証後、コードを入力してください."
    gdrive list


    MakeDir

fi

