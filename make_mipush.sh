#!/usr/bin/sh

PARAM_NUM=$#
APK_PATH="$1"
APKTOOL_PATH="$2"
OUT_PATH="$3"

if [ $PARAM_NUM -lt 2 ]; then
    echo "Usage: ./make_mipush.sh APK_PATH APKTOOL_PATH [OUT_PATH]"
    exit 0
fi

[ $PARAM_NUM -lt 3 ] && OUT_PATH="$APK_PATH"

$APKTOOL_PATH d "$APK_PATH" -o out
sed -i '/"top.trumeet.mipushframework.wizard.WelcomeActivity"/,/activity/d' out/AndroidManifest.xml
$APKTOOL_PATH b out -o "$OUT_PATH"
rm -rf out/

echo "Done"
exit 0