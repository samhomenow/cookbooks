#
# Cookbook Name:: docchef
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

depends 'docker', '~> 2.0'

docker_image 'praveensams/node' do
  action :pull
  end
