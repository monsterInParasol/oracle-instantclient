#
# Author:: Pablo Fonseca (<pabloramon21@gmail.com>)
# Cookbook Name:: oracle-instantclient
# Attributes:: default
#
# Copyright 2014, Pablo Fonseca
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

execute "unzip #{node['oracle-instantclient']['sqldeveloper-zip']} -d /opt" do
  user 'root'
  cwd node['oracle-instantclient']['rpm_dir']
  creates '/opt/sqldeveloper'
end

bash 'symlink to sqldeveloper' do
  sd = 'sqldeveloper'
  bin_path = "/opt/#{sd}/#{sd}/bin/#{sd}"
  code = <<-EOF
    "chmod 755 #{bin_path}"
    "ln -sf #{bin_path} /usr/local/bin/#{sd}"
    EOF
end

execute "set JAVA_HOME for sqldeveloper" do
  default_user = node['oracle-instantclient']['default_user']
  user default_user
  cwd "/home/#{default_user}/.sqldeveloper/4.0.0/"
  command %Q[sed -i 's:# \\(SetJavaHome \\).*$:\\1#{node['oracle-instantclient']['java_home']}:g' product.conf]
end

file "create sqldeveloper shortcut" do
  default_user = node['oracle-instantclient']['default_user']
  path "/home/#{default_user}/Desktop/sqldeveloper.desktop"
  content <<-EOH
[Desktop Entry]
Exec=sqldeveloper
Terminal=false
StartupNotify=true
Categories=GNOME;Oracle;
Type=Application
Icon=/opt/sqldeveloper/icon.png
Name=Oracle SQL Developer
  EOH
  user default_user
  group default_user
end

