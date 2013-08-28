#
# Cookbook Name:: wlcserver
# Recipe:: default
#
# Copyright 2013, Michael Koppen
#
# All rights reserved - Do Not Redistribute
#
default['wlcserver']['glassfish']['domain_name'] = "domain1"
default['wlcserver']['glassfish']['admin_name'] = "admin"
default['wlcserver']['glassfish']['admin_port'] = 4848
default['wlcserver']['glassfish']['admin_password'] = "password"
default['wlcserver']['glassfish']['terse'] = false
default['wlcserver']['glassfish']['echo'] = true
default['wlcserver']['glassfish']['secure'] = false
default['wlcserver']['glassfish']['domain_port'] = 80
default['wlcserver']['glassfish']['max_stack_size'] = 1024
default['wlcserver']['glassfish']['max_memory'] = 512
default['wlcserver']['glassfish']['max_perm_size'] = 512
default['wlcserver']['glassfish']['perm_size'] = 512

default['wlcserver']['glassfish']['production']['jdbc_connection_pool']['name'] = "CodingConnectionPool"
default['wlcserver']['glassfish']['production']['jdbc_connection_pool']['description'] = ""
default['wlcserver']['glassfish']['production']['jdbc_connection_pool']['allow-non-component-callers'] = false
default['wlcserver']['glassfish']['production']['jdbc_connection_pool']['associate-with-thread'] = false
default['wlcserver']['glassfish']['production']['jdbc_connection_pool']['connection-creation-retry-attempts'] = 0
default['wlcserver']['glassfish']['production']['jdbc_connection_pool']['connection-creation-retry-interval-in-seconds'] = 10
default['wlcserver']['glassfish']['production']['jdbc_connection_pool']['connection-leak-reclaim'] = false
default['wlcserver']['glassfish']['production']['jdbc_connection_pool']['connection-leak-timeout-in-seconds'] = 0
default['wlcserver']['glassfish']['production']['jdbc_connection_pool']['connection-validation-method'] = "auto-commit"
default['wlcserver']['glassfish']['production']['jdbc_connection_pool']['datasource-classname'] = "com.mysql.jdbc.jdbc2.optional.MysqlDataSource"
default['wlcserver']['glassfish']['production']['jdbc_connection_pool']['fail-all-connections'] = false
default['wlcserver']['glassfish']['production']['jdbc_connection_pool']['idle-timeout-in-seconds'] = 300
default['wlcserver']['glassfish']['production']['jdbc_connection_pool']['is-connection-validation-required'] = true
default['wlcserver']['glassfish']['production']['jdbc_connection_pool']['is-isolation-level-guaranteed'] = true
default['wlcserver']['glassfish']['production']['jdbc_connection_pool']['lazy-connection-association'] = false
default['wlcserver']['glassfish']['production']['jdbc_connection_pool']['lazy-connection-enlistment'] = false
default['wlcserver']['glassfish']['production']['jdbc_connection_pool']['match-connections'] = false
default['wlcserver']['glassfish']['production']['jdbc_connection_pool']['max-connection-usage-count'] = 0
default['wlcserver']['glassfish']['production']['jdbc_connection_pool']['max-pool-size'] = 100
default['wlcserver']['glassfish']['production']['jdbc_connection_pool']['max-wait-time-in-millis'] = 60000
default['wlcserver']['glassfish']['production']['jdbc_connection_pool']['non-transactional-connections'] = false
default['wlcserver']['glassfish']['production']['jdbc_connection_pool']['ping'] = true
default['wlcserver']['glassfish']['production']['jdbc_connection_pool']['pool-resize-quantity'] = 2
default['wlcserver']['glassfish']['production']['jdbc_connection_pool']['pooling'] = true
default['wlcserver']['glassfish']['production']['jdbc_connection_pool']['res-type'] = "javax.sql.DataSource"
default['wlcserver']['glassfish']['production']['jdbc_connection_pool']['statement-cache-size'] = 0
default['wlcserver']['glassfish']['production']['jdbc_connection_pool']['statement-leak-reclaim'] = false
default['wlcserver']['glassfish']['production']['jdbc_connection_pool']['statement-leak-timeout-in-seconds'] = 0
default['wlcserver']['glassfish']['production']['jdbc_connection_pool']['statement-timeout-in-seconds'] = 0
default['wlcserver']['glassfish']['production']['jdbc_connection_pool']['steady-pool-size'] = 20
default['wlcserver']['glassfish']['production']['jdbc_connection_pool']['validate-atmost-once-period-in-seconds'] = 0
default['wlcserver']['glassfish']['production']['jdbc_connection_pool']['wrap-jdbc-objects'] = false
default['wlcserver']['glassfish']['production']['jdbc_connection_pool']['transaction-isolation-level'] = "repeatable-read"


default['wlcserver']['glassfish']['production']['jdbc_resource']['pool-name'] = "#{node['wlcserver']['glassfish']['production']['jdbc_connection_pool']['name']}"
default['wlcserver']['glassfish']['production']['jdbc_resource']['jndi-name'] = "jdbc/coding"
default['wlcserver']['glassfish']['production']['jdbc_resource']['enabled'] = true
default['wlcserver']['glassfish']['production']['jdbc_resource']['description'] = ""

default['wlcserver']['glassfish']['test']['jdbc_connection_pool']['name'] = "CodingTestConnectionPool"
default['wlcserver']['glassfish']['test']['jdbc_connection_pool']['description'] = ""
default['wlcserver']['glassfish']['test']['jdbc_connection_pool']['allow-non-component-callers'] = false
default['wlcserver']['glassfish']['test']['jdbc_connection_pool']['associate-with-thread'] = false
default['wlcserver']['glassfish']['test']['jdbc_connection_pool']['connection-creation-retry-attempts'] = 0
default['wlcserver']['glassfish']['test']['jdbc_connection_pool']['connection-creation-retry-interval-in-seconds'] = 10
default['wlcserver']['glassfish']['test']['jdbc_connection_pool']['connection-leak-reclaim'] = false
default['wlcserver']['glassfish']['test']['jdbc_connection_pool']['connection-leak-timeout-in-seconds'] = 0
default['wlcserver']['glassfish']['test']['jdbc_connection_pool']['connection-validation-method'] = "auto-commit"
default['wlcserver']['glassfish']['test']['jdbc_connection_pool']['datasource-classname'] = "com.mysql.jdbc.jdbc2.optional.MysqlDataSource"
default['wlcserver']['glassfish']['test']['jdbc_connection_pool']['fail-all-connections'] = false
default['wlcserver']['glassfish']['test']['jdbc_connection_pool']['idle-timeout-in-seconds'] = 300
default['wlcserver']['glassfish']['test']['jdbc_connection_pool']['is-connection-validation-required'] = true
default['wlcserver']['glassfish']['test']['jdbc_connection_pool']['is-isolation-level-guaranteed'] = true
default['wlcserver']['glassfish']['test']['jdbc_connection_pool']['lazy-connection-association'] = false
default['wlcserver']['glassfish']['test']['jdbc_connection_pool']['lazy-connection-enlistment'] = false
default['wlcserver']['glassfish']['test']['jdbc_connection_pool']['match-connections'] = false
default['wlcserver']['glassfish']['test']['jdbc_connection_pool']['max-connection-usage-count'] = 0
default['wlcserver']['glassfish']['test']['jdbc_connection_pool']['max-pool-size'] = 32
default['wlcserver']['glassfish']['test']['jdbc_connection_pool']['max-wait-time-in-millis'] = 60000
default['wlcserver']['glassfish']['test']['jdbc_connection_pool']['non-transactional-connections'] = false
default['wlcserver']['glassfish']['test']['jdbc_connection_pool']['ping'] = true
default['wlcserver']['glassfish']['test']['jdbc_connection_pool']['pool-resize-quantity'] = 2
default['wlcserver']['glassfish']['test']['jdbc_connection_pool']['pooling'] = true
default['wlcserver']['glassfish']['test']['jdbc_connection_pool']['res-type'] = "javax.sql.DataSource"
default['wlcserver']['glassfish']['test']['jdbc_connection_pool']['statement-cache-size'] = 0
default['wlcserver']['glassfish']['test']['jdbc_connection_pool']['statement-leak-reclaim'] = false
default['wlcserver']['glassfish']['test']['jdbc_connection_pool']['statement-leak-timeout-in-seconds'] = 0
default['wlcserver']['glassfish']['test']['jdbc_connection_pool']['statement-timeout-in-seconds'] = 0
default['wlcserver']['glassfish']['test']['jdbc_connection_pool']['steady-pool-size'] = 8
default['wlcserver']['glassfish']['test']['jdbc_connection_pool']['validate-atmost-once-period-in-seconds'] = 0
default['wlcserver']['glassfish']['test']['jdbc_connection_pool']['wrap-jdbc-objects'] = false
default['wlcserver']['glassfish']['test']['jdbc_connection_pool']['transaction-isolation-level'] = "repeatable-read"


default['wlcserver']['glassfish']['test']['jdbc_resource']['pool-name'] = "#{node['wlcserver']['glassfish']['test']['jdbc_connection_pool']['name']}"
default['wlcserver']['glassfish']['test']['jdbc_resource']['jndi-name'] = "jdbc/coding_test"
default['wlcserver']['glassfish']['test']['jdbc_resource']['enabled'] = true
default['wlcserver']['glassfish']['test']['jdbc_resource']['description'] = ""

default['wlcserver']['glassfish']['auth_realm']['realm_name'] = "CodingRealm"
default['wlcserver']['glassfish']['auth_realm']['classname'] = "com.sun.enterprise.security.auth.realm.jdbc.JDBCRealm"
default['wlcserver']['glassfish']['auth_realm']['jaas_context'] = "jdbcRealm"
default['wlcserver']['glassfish']['auth_realm']['assign_groups'] = nil
