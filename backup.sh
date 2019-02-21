#!/usr/bin/env bash

# local path to WordPress
localCorePath='/Users/susumu/Project/susumu/www/'

# local path for backups
localBackupPath='./'

# backup date
backupDate='backup-'`date '+%Y-%m-%d'`

# now location
imhere=$(pwd)

# get WordPress options
cd $localCorePath
siteName=$(wp option get blogname)
themeName=$(wp option get template)
cd $imhere

# backup file name
backupFileName=$localPath$backupDate'-'$themeName
backupFileNameZip=$backupFileName'.zip'

# 今日の日付でディレクトリを作成する
mkdir $backupFileName

# その中に移動する
cd $localPath$backupFileName


# dbをエクスポートする
wp db export --path=$localCorePath

# wp-contentをzipする
zip -r wpcore.zip $localCorePath
cd $imhere

# 日付のディレクトリをzipする
zip -r $localPath$backupFileNameZip $backupFileName
rm -rf $localPath$backupFileName

function sendGdrive() {
    echo "バックアップをGoogle Driveに送りますか？"
    echo "  yes または no と入力して下さい."
    read sendGdrive

    if [ -z $sendGdrive ]; then

        echo "  yes または no を入力して下さい."
        sendGdrive
        echo "バックアップの送信が完了しました."

    elif [ $sendGdrive = 'yes' ] || [ $sendGdrive = 'YES' ] || [ $sendGdrive = 'y' ] ; then

        gdrive mkdir "wp_backups"

    elif [ $sendGdrive = 'no' ] || [ $sendGdrive = 'NO' ] || [ $sendGdrive = 'n' ] ; then

        echo "バックアップが完了しました."

    else

        echo "  yes または no を入力して下さい."
        sendGdrive

    fi


}

# gdirveでディレクトリに送る
## remote path for backups
remoteBackupPath='wp_backup'

backupId=$(gdrive list --no-header | grep $remoteBackupPath | grep dir | awk '{ print $1}')
    if [ -z "$backupId" ]; then
        gdrive mkdir $remoteBackupPath
        BACKUPSID=$(gdrive list --no-header | grep $remoteBackupPath | grep dir | awk '{ print $1}')
    fi

gdrive upload --parent $backupId --delete $localPath$backupFileNameZip