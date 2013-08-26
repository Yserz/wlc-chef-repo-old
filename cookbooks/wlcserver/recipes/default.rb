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
include_recipe "mysql::ruby"
include_recipe "java"
include_recipe "glassfish::attribute_driven_domain"
include_recipe "jenkins"

#Create Production-Database for WLC
mysql_database node['wlcserver']['database'] do
  connection ({
    :host => 'localhost', 
    :username => 'root', 
    :password => node['mysql']['server_root_password']})
  action :create
end

# Create Test-Database for WLC
mysql_database node['wlcserver']['test_database'] do
  connection ({
    :host => 'localhost',
    :username => 'root',
    :password => node['mysql']['server_root_password']})
  action :create
end

# Create Database-User and grant access for Production-Database
mysql_database_user node['wlcserver']['db_username'] do
  connection ({
    :host => 'localhost', 
    :username => 'root', 
    :password => node['mysql']['server_root_password']})
  password node['wlcserver']['db_password']
  database_name node['wlcserver']['database']
  privileges [:select,:update,:insert,:create,:delete]
  action :grant
end

# Create Database-User and grant access for Test-Database
mysql_database_user node['wlcserver']['db_username'] do
  connection ({
    :host => 'localhost',
    :username => 'root',
    :password => node['mysql']['server_root_password']})
  password node['wlcserver']['db_password']
  database_name node['wlcserver']['test_database']
  privileges [:select,:update,:insert,:create,:delete]
  action :grant
end

# GLASSFISH #
# Create WLC JDBC Connection Pool
#glassfish_jdbc_connection_pool node['wlcserver']['glassfish']['jdbc_connection_pool']['name'] do
#  pool_name node['wlcserver']['glassfish']['jdbc_connection_pool']['pool_name']
#  datasourceclassname node['wlcserver']['glassfish']['jdbc_connection_pool']['']
