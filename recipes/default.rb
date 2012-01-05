#
# Cookbook Name:: greenscreen
# Recipe:: default
#
# Copyright 2011, CustomInk, LLC
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
#
include_recipe "git"

gem_package "rake"

gem_package "hpricot" do
  version "0.8.2"
end

gem_package "rack" do
  version "1.2.1"
end

gem_package "shotgun" do
  version "0.8"
end

gem_package "sinatra" do
  version "1.0"
end

node["greenscreens"].each do |gs|
  greenscreen_directory = "#{node["greenscreen"]["install_dir"]}/#{gs["name"]}"

  directory greenscreen_directory do
    recursive true
  end
  
  execute "Clone the Greenscreen repository and initiliaze the application" do
    cwd greenscreen_directory
    command "if [ ! -e #{node["greenscreen"]["install_dir"]}/#{gs["name"]}/.git ]; then git clone git://github.com/customink/greenscreen.git .; fi && rake -f init.rakefile"
  end

  
  template "#{node["greenscreen"]["install_dir"]}/#{gs["name"]}/config.yml" do
    source "config.yml.erb"
    owner "root"
    group "root"
    variables(
      :servers => gs["servers"]
    )
  end
  
  execute "launch greenscreen" do
    ruby_bin=`which ruby`.strip

    cwd greenscreen_directory
    command "su root -c 'nohup #{ruby_bin} #{node["greenscreen"]["install_dir"]}/#{gs["name"]}/greenscreen.rb -p #{gs[:port]} > #{node["greenscreen"]["install_dir"]}/#{gs["name"]}/greenscreen.log 2>&1 &';"

    not_if "ps -ef | grep '[g]reenscreen -p #{gs[:port]}"
  end
  
end