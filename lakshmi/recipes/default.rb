#
# Cookbook Name:: lakshmi
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

collect=search("node","role:web")

template "/tmp/sam" do
     source "sam.erb" 
     variables( :collections => collect )
end


