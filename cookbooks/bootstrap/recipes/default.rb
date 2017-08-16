#
# Cookbook:: bootstrap
# Recipe:: default
#
# Copyright:: 2017, Travis N. Thomsen for Linux Academy, All Rights Reserved.

include_recipe 'sshd::default'
include_recipe 'cloudcli::default'

service 'sshd' do
  action :stop
end

if node['platform_family'] == "debian"

  user 'cloud_user' do
    home '/home/cloud_user'
    manage_home true
    shell '/bin/bash'
    password '$1$linuxaca$iGMxZ4g4lbPmfEDPhW3lw1'
    salt 'linuxacademy'
    gid 'sudo'
  end

  group 'cloud_user' do
    members 'cloud_user'
  end
  openssh_server '/etc/ssh/sshd_config' do
    PasswordAuthentication yes
  end
end

service 'sshd' do
  action :start
end
