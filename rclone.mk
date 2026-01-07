################################################################################
#
# rclone
#
################################################################################

RCLONE_VERSION = 1.66.0
RCLONE_SOURCE = rclone-v$(RCLONE_VERSION)-linux-arm64.zip
RCLONE_SITE = https://github.com/rclone/rclone/releases/download/v$(RCLONE_VERSION)
RCLONE_SHA256 = c50a3ab93082f21788f9244393b19f2426edeeb896eec2e3e05ffb2e8727e075
# 使用wget方法，确保文件下载到dl目录
RCLONE_SITE_METHOD = wget

# 由于是zip文件，需要定义提取步骤
define RCLONE_EXTRACT_CMDS
    $(UNZIP) -d $(@D) $(DL_DIR)/$(RCLONE_SOURCE)
endef

# 安装步骤
define RCLONE_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/rclone-v$(RCLONE_VERSION)-linux-arm64/rclone $(TARGET_DIR)/usr/bin/rclone
endef

$(eval $(generic-package))
