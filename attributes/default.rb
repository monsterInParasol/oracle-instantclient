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

default['oracle-instantclient']['rpm_dir'] = '/vagrant'

default['oracle-instantclient']['sqlplus-rpm'] = node['kernel']['machine'] == 'x86_64' ? 'oracle-instantclient12.1-sqlplus-12.1.0.2.0-1.x86_64.rpm' : 'oracle-instantclient12.1-sqlplus-12.1.0.2.0-1.i386.rpm'

default['oracle-instantclient']['sdk-rpm'] = node['kernel']['machine'] == 'x86_64' ? 'oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm' : 'oracle-instantclient12.1-devel-12.1.0.2.0-1.i386.rpm'

default['oracle-instantclient']['basic-rpm'] = node['kernel']['machine'] == 'x86_64' ? 'oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm' : 'oracle-instantclient12.1-basic-12.1.0.2.0-1.i386.rpm'

default['oracle-instantclient']['sqldeveloper-zip'] = 'sqldeveloper-4.0.3.16.84-no-jre.zip'

default['oracle-instantclient']['default_user'] = 'ubuntu'
default['oracle-instantclient']['java_home'] = '/usr/lib/jvm/java-7-openjdk-amd64/'

# If this automatic attempt to deduce major version fails
# then please set manually
default['oracle-instantclient']['version'] = default['oracle-instantclient']['sqlplus-rpm'].split('-')[1].sub(/instantclient/, '')
