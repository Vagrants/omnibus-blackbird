name "blackbird"
default_version "0.4.5"

dependency "python"
dependency "python-pip"

version "0.4.4" do
  source url: "https://github.com/Vagrants/blackbird/archive/v#{version}.tar.gz",
         md5: "3fb2aa0fe0df19a47c719a9e6c831e74"
end

version "0.4.5" do
  source url: "https://github.com/Vagrants/blackbird/archive/v#{version}.tar.gz",
         md5: "4484a53e1ec4c42f813ea8b1753165bd"
end

relative_path "blackbird-#{version}"

build do
  command "#{install_dir}/embedded/bin/pip install -r requirements.txt"
  command "#{install_dir}/embedded/bin/python setup.py install"

  mkdir "#{install_dir}/plugins"
  mkdir "/etc/blackbird/conf.d"
  mkdir "/usr/lib/systemd/system"

  command "sed -i s'|#!/usr/bin/env python|#!/opt/blackbird/embedded/bin/python|' scripts/blackbird.bin"
  command "chmod 0755 scripts/blackbird.bin"
  copy "scripts/blackbird.bin", "/usr/bin/blackbird"

  copy "scripts/blackbird.cfg",               "/etc/blackbird/defaults.cfg"
  copy "scripts/blackbird-statistics.cfg",    "/etc/blackbird/conf.d/statistics.cfg"
  copy "scripts/blackbird-zabbix_sender.cfg", "/etc/blackbird/conf.d/zabbix_sender.cfg"
  copy "scripts/blackbird.sysconfig",         "/etc/sysconfig/blackbird"
  copy "scripts/blackbird.logrotate",         "/etc/logrotate.d/blackbird"
  copy "scripts/blackbird.service",           "/usr/lib/systemd/system/blackbird.service"
end
