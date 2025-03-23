#!/system/bin/sh

# 定义路径
FILE_PATH="/data/adb/shamiko/whitelist"

# 检查文件是否存在
if [ -f "$FILE_PATH" ]; then
# 如果文件存在，则移除它
rm -f "$FILE_PATH"
echo "File $FILE_PATH shamiko黑名单模式."
else
# 如果文件不存在，则创建它
mkdir -p /data/adb/shamiko
touch "$FILE_PATH"
echo "File $FILE_PATH shamiko白名单模式，如果出现大量的软件闪退，请切回黑名单模式."
fi