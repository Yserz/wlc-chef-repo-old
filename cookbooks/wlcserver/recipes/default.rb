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
  action                      :create
end

# Create Test-Database for WLC
mysql_database node['wlcserver']['test_database'] do
  connection ({
                                :host => 'localhost',
                                :username => 'root',
                                :password => node['mysql']['server_root_password']})
  action                      :create
end

# Create Database-User and grant access for Production-Database
mysql_database_user node['wlcserver']['database_username'] do
  connection ({
                                :host => 'localhost', 
                                :username => 'root', 
                                :password => node['mysql']['server_root_password']})
  password                    node['wlcserver']['database_password']
  database_name               node['wlcserver']['database']
  privileges                  [:select,:update,:insert,:create,:delete]
  action                      :grant
end

# Create Database-User and grant access for Test-Database
mysql_database_user node['wlcserver']['database_username'] do
  connection ({
                                :host => 'localhost',
                                :username => 'root',
                                :password => node['mysql']['server_root_password']})
  password                    node['wlcserver']['database_password']
  database_name               node['wlcserver']['test_database']
  privileges                  [:select,:update,:insert,:create,:delete]
  action                      :grant
end

# GLASSFISH #
# Create Domain
glassfish_domain "domain1" do
  domain_name                 node['wlcserver']['glassfish']['domain_name']
  port                        80
  username                    node['wlcserver']['glassfish']['admin_name']
  password_file               node['wlcserver']['glassfish']['admin_password']
  admin_port                  node['wlcserver']['glassfish']['admin_port']
  secure                      node['wlcserver']['glassfish']['secure']
  terse                       node['wlcserver']['glassfish']['terse']
  echo                        node['wlcserver']['glassfish']['echo']
#  extra_libraries             ['https://github.com/Yserz/WLC-Chef-Repo/blob/master/mysql-connector-java-5.1.26-bin.jar?raw=true']
  max_stack_size              512
end

# Create WLC JDBC Connection Pool
glassfish_jdbc_connection_pool node['wlcserver']['glassfish']['jdbc_connection_pool']['name'] do
  # Global settings
  domain_name                 node['wlcserver']['glassfish']['domain_name']
  username                    node['wlcserver']['glassfish']['admin_name']
  password_file               node['wlcserver']['glassfish']['admin_password']
  admin_port                  node['wlcserver']['glassfish']['admin_port']
  secure                      node['wlcserver']['glassfish']['secure']
  terse                       node['wlcserver']['glassfish']['terse']
  echo                        node['wlcserver']['glassfish']['echo']
  
  # Pool settings
  #  initsql nil
  #  sqltracelisteners nil
  #  driverclassname node['wlcserver']['glassfish']['jdbc_connection_pool']['']
  #  validationclassname nil
  #  validationtable nil
  #  isolationlevel:
  pool_name                   node['wlcserver']['glassfish']['jdbc_connection_pool']['name']
  description                 node['wlcserver']['glassfish']['jdbc_connection_pool']['description']
  allownoncomponentcallers    node['wlcserver']['glassfish']['jdbc_connection_pool']['allow-non-component-callers']
  associatewiththread         node['wlcserver']['glassfish']['jdbc_connection_pool']['associate-with-thread']
  creationretryattempts       node['wlcserver']['glassfish']['jdbc_connection_pool']['connection-creation-retry-attempts']
  creationretryinterval       node['wlcserver']['glassfish']['jdbc_connection_pool']['connection-creation-retry-interval-in-seconds']
  leakreclaim                 node['wlcserver']['glassfish']['jdbc_connection_pool']['connection-leak-reclaim']
  leaktimeout                 node['wlcserver']['glassfish']['jdbc_connection_pool']['connection-leak-timeout-in-seconds']
  validationmethod            node['wlcserver']['glassfish']['jdbc_connection_pool']['connection-validation-method']
  datasourceclassname         node['wlcserver']['glassfish']['jdbc_connection_pool']['datasource-classname']
  failconnection              node['wlcserver']['glassfish']['jdbc_connection_pool']['fail-all-connections']
  idletimeout                 node['wlcserver']['glassfish']['jdbc_connection_pool']['idle-timeout-in-seconds']
  isconnectvalidatereq        node['wlcserver']['glassfish']['jdbc_connection_pool']['is-connection-validation-required']
  isisolationguaranteed       node['wlcserver']['glassfish']['jdbc_connection_pool']['is-isolation-level-guaranteed']
  lazyconnectionassociation   node['wlcserver']['glassfish']['jdbc_connection_pool']['lazy-connection-association']
  lazyconnectionenlistment    node['wlcserver']['glassfish']['jdbc_connection_pool']['lazy-connection-enlistment']
  matchconnections            node['wlcserver']['glassfish']['jdbc_connection_pool']['match-connections']
  maxconnectionusagecount     node['wlcserver']['glassfish']['jdbc_connection_pool']['max-connection-usage-count']
  maxpoolsize                 node['wlcserver']['glassfish']['jdbc_connection_pool']['max-pool-size']
  maxwait                     node['wlcserver']['glassfish']['jdbc_connection_pool']['max-wait-time-in-millis']
  nontransactionalconnections node['wlcserver']['glassfish']['jdbc_connection_pool']['non-transactional-connections']
  ping                        node['wlcserver']['glassfish']['jdbc_connection_pool']['ping']
  poolresize                  node['wlcserver']['glassfish']['jdbc_connection_pool']['pool-resize-quantity']
  pooling                     node['wlcserver']['glassfish']['jdbc_connection_pool']['pooling']
  restype                     node['wlcserver']['glassfish']['jdbc_connection_pool']['res-type']
  statementcachesize          node['wlcserver']['glassfish']['jdbc_connection_pool']['statement-cache-size']
  statmentleakreclaim         node['wlcserver']['glassfish']['jdbc_connection_pool']['statement-leak-reclaim']
  statementleaktimeout        node['wlcserver']['glassfish']['jdbc_connection_pool']['statement-leak-timeout-in-seconds']
  statementtimeout            node['wlcserver']['glassfish']['jdbc_connection_pool']['statement-timeout-in-seconds']
  steadypoolsize              node['wlcserver']['glassfish']['jdbc_connection_pool']['steady-pool-size']
  validateatmostonceperiod    node['wlcserver']['glassfish']['jdbc_connection_pool']['validate-atmost-once-period-in-seconds']
  wrapjdbcobjects             node['wlcserver']['glassfish']['jdbc_connection_pool']['wrap-jdbc-objects']
  properties ({
    :URL =>                      "jdbc:mysql://localhost:3306/#{node['wlcserver']['database']}",
    :User =>                     node['wlcserver']['database_username'],
    :Password =>                 node['wlcserver']['database_password']
  })
end

glassfish_jdbc_resource node['wlcserver']['glassfish']['jdbc_resource']['name'] do
  # Global settings
  domain_name                 node['wlcserver']['glassfish']['domain_name']
  username                    node['wlcserver']['glassfish']['admin_name']
  password_file               node['wlcserver']['glassfish']['admin_password']
  admin_port                  node['wlcserver']['glassfish']['admin_port']
  secure                      node['wlcserver']['glassfish']['secure']
  terse                       node['wlcserver']['glassfish']['terse']
  echo                        node['wlcserver']['glassfish']['echo']
  
  # Resource settings
  connectionpoolid            node['wlcserver']['glassfish']['jdbc_resource']['pool-name']
  resource_name               node['wlcserver']['glassfish']['jdbc_resource']['jndi-name']
  enabled                     node['wlcserver']['glassfish']['jdbc_resource']['enabled']
  description                 node['wlcserver']['glassfish']['jdbc_resource']['description']
#  target                      
#  properties               
end

#  realm_name:
#  target: Defaults to "server".
#  classname:
#  jaas_context node['wlcserver']['glassfish']['jdbc_connection_pool']['']
#  assign_groups node['wlcserver']['glassfish']['jdbc_connection_pool']['']
#  properties: Defaults to {}.
#  domain_name: The name of the domain.
#  terse: Use terse output from the underlying asadmin. Defaults to false.
#  echo: If true, echo commands supplied to asadmin. Defaults to true.
#  username: The username to use when communicating with the domain. Defaults to nil.
#  password_file: The file in which the password must be stored assigned to appropriate key. Defaults to nil.
#  secure: If true use SSL when communicating with the domain for administration. Defaults to false.
#  admin_port: The port on which the web management console is bound. Defaults to 4848.
