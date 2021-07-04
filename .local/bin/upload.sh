#! /usr/bin/env bash
path=$(realpath "$1") 
url=$(curl -s -F "reqtype=fileupload" -F "fileToUpload=@${path}" https://catbox.moe/user/api.php)
echo "Uploaded at $url"
