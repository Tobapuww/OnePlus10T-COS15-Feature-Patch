#!/system/bin/sh
SKIPMOUNT=false
PROPFILE=false
POSTFSDATA=false
LATESTARTSERVICE=false

MODDIR=$(dirname "$0")

# 允许安装的机型
ALLOWED_MODEL="PGP110"

# 功能列表（以换行符分隔）
FEATURES="通信相关
5G 模式开关
VoNR（开发者选项）
人声突显
无网畅聊
一碰互联
智能云加速
卫星网络
第三方蓝牙高清音频 LHDC5
AI 相关
AI 笔记助手（便签）
AI 文档助手
AI 帮写
AI 游戏优化相关
AI 文档翻译
显示相关
DC 调光（开发者选项）
纸质护眼
音量条调节回弹动画
交互动画增强
抖音直播美颜
马里亚纳介绍页面
电池健康度
壁纸动画
息屏显示防烧
其他功能
游戏 4D 震动
电话本触碰分享
双小窗
自动追焦
调整亮度范围（开发者）
应用音量单独设置
拖动无极音量调节
触控优化
智感支付
隔空翻页
隔空播放与暂停"

# 安装模块的逻辑
on_install() {
  ui_print "开始检查机型适配..."
  
  # 获取设备型号
  DEVICE_MODEL=$(getprop ro.product.model)
  
  # 检查是否为指定机型
  if [ "$DEVICE_MODEL" = "$ALLOWED_MODEL" ]; then
    ui_print "机型适配正确: $DEVICE_MODEL"
    ui_print "正在开启如下功能："
    
    # 逐行打印功能列表
    echo "$FEATURES" | while read FEATURE; do
      [ -n "$FEATURE" ] && ui_print "正在激活 $FEATURE"
      sleep 0.1 # 可选：增加延时模拟逐步加载
    done
    
    ui_print "模块安装中，请稍候..."
    # 在此添加模块的具体安装逻辑

    ui_print "恭喜！激活完毕，请重启设备后享受！"
  else
    ui_print "该模块不适用您的手机型号 ($DEVICE_MODEL)。"
    ui_print "请选择适配您机型的模块，谢谢！"
    exit 1
  fi
}

# 设置模块的全局权限
set_permissions() {
  set_perm_recursive $MODPATH 0 0 0755 0644
}
