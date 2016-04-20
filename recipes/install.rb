directory "#{node['kafka-manager']['directory_rpm']}" do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

remote_file "#{node['kafka-manager']['directory_rpm']}/#{node['kafka-manager']['name_rpm']}" do
  source node['kafka-manager']['source_rpm']
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

execute "install kafka-manager" do
  command "yum localinstall -y #{node['kafka-manager']['name_rpm']}"
  cwd "#{node['kafka-manager']['directory_rpm']}"
end
