#
# Cookbook Name:: wlcserver
# Recipe:: default
#
# Copyright 2013, Michael Koppen
#
# All rights reserved - Do Not Redistribute
#


include_recipe "mysql::client"
include_recipe "mysql::server"
