#!/usr/bin/env bash

# local path to WordPress
localCorePath='/Users/susumu/Project/susumu/www/'

# local path for backups
localBackupPath='./'

# remote path for backups
remoteBackupPath=''

# remote directory id
dirId=''

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
rm -rf $backupFileName

# gdirveでディレクトリに送る
