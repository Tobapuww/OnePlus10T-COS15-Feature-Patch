#!/system/bin/sh
# 请不要硬编码 /magisk/modname/... ; 请使用 $MODDIR/...
#MODDIR=${0%/*}
#MNT="/" #从根目录挂载（默认从/mnt/vendor/挂载）
# 这将使你的脚本更加兼容，即使Magisk在未来改变了它的挂载点
MODDIR=${0%/*}
TMPDIR=${0%/*}/mod

mount --bind $MODDIR/my_product/etc/extension/ /my_product/etc/extension/
mount --bind $MODDIR/my_product/etc/permissions/ /my_product/etc/permissions/
for i in `/bin/find $TMPDIR -type f -printf "%P "`; do
    /bin/mount /$TMPDIR/$i /$i
    restorecon /$i
done
# 这个脚本将以 post-fs-data 模式执行(系统启动前执行)
# 更多信息请访问 Magisk 主题
