template "/etc/systemd/system/kafka-manager.service" do
  source "kafka-manager.service.erb"
  owner 'root'
  group 'root'
  mode '0755'
end

file "/etc/rd.c/init.d/kafka-manager" do
  action :delete
end

execute "restart systemctl" do
  command "systemctl daemon-reload"
  
end


template "/etc/kafka-manager/application.ini" do
  source "application.ini.erb"
  owner 'root'
  group 'root'
  mode '0755'
end

template "/etc/kafka-manager/application.conf" do
  source "application.conf.erb"
  owner 'root'
  group 'root'
  mode '0755'
end

service 'kafka-manager' do
  action :restart
end
