#
# Copyright 2015 makocchi
#
# All Rights Reserved.
#

build_version "0.4.4"
build_iteration 1

name "blackbird"
maintainer "makocchi <makocchi@gmail.com>"
homepage "https://github.com/Vagrants/blackbird"
description <<"DESC"
blackbird is one like observation agent.
At present (sending data part is pluggable, so blackbird can send data to besides it)
blackbird send data to your zabbix server by using zabbix sender protocol.
DESC

package :rpm do
  vendor "vagrants"
  license "WTFPL License"
  category "Monitoring"
end

# Defaults to C:/blackbird on Windows
# and /opt/blackbird on all other platforms
install_dir "#{default_root}/#{name}"

# Creates required build directories
dependency "preparation"

# blackbird dependencies/components
dependency "python"
dependency "python-setuptools"
dependency "python-pip"
dependency "blackbird_el7"

# Version manifest file
dependency "version-manifest"

extra_package_file "/usr/lib/systemd/system/blackbird.service"
extra_package_file "/etc/sysconfig/blackbird"
extra_package_file "/etc/logrotate.d/blackbird"
extra_package_file "/etc/blackbird/defaults.cfg"
extra_package_file "/etc/blackbird/conf.d/statistics.cfg"
extra_package_file "/etc/blackbird/conf.d/zabbix_sender.cfg"
extra_package_file "/usr/bin/blackbird"

exclude "**/.git"
exclude "**/bundler/git"
exclude "**/.py[co]"
