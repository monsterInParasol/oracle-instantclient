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


define :install_rpm, pkg: nil do
  execute "install #{params[:pkg]}" do
  user 'root'
  command "alien -i #{node['oracle-instantclient'][params[:pkg]+'-rpm']}"
  cwd node['oracle-instantclient']['rpm_dir']
  end
end
