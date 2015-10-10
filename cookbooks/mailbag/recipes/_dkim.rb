node['opendkim']['packages']['tools'].each do |dkim_tool_package|
  package dkim_tool_package
end

node.override['opendkim']['conf']['Mode'] = 'sv'
node.override['opendkim']['conf']['Socket'] = "local:#{node['mailbag']['postfix_private_dir']}/#{node['mailbag']['opendkim_socket']}"
node.override['opendkim']['conf']['Selector'] = node.name
node.override['opendkim']['conf']['Syslog'] = 'yes'
node.override['opendkim']['conf']['UserID'] = "#{node['opendkim']['user']}:#{node['opendkim']['group']}"
node.override['opendkim']['conf']['Keyfile'] = "#{node['mailbag']['opendkim_dir']}/#{node.name}.private"
node.override['opendkim']['conf']['Domain'] = node['ranchhand']['domain_name']
include_recipe 'opendkim'

# This directory will store the DKIM key and example configuration
directory node['mailbag']['opendkim_dir'] do
  mode '0700'
  owner node['opendkim']['user']
  group node['opendkim']['group']
end

execute 'opendkim-genkey' do
  command "/usr/bin/opendkim-genkey -s #{node.name} -b 2048 -r -d #{node['ranchhand']['domain_name']} -D #{node['mailbag']['opendkim_dir']}"
  creates "#{node['mailbag']['opendkim_dir']}/#{node.name}.private"
  user  node['opendkim']['user']
  group node['opendkim']['group']
end

file "#{node['mailbag']['opendkim_dir']}/#{node.name}.private" do
  mode '0600'
  owner node['opendkim']['user']
  group node['opendkim']['group']
end