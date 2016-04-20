
directory "/tmp/kafka" do
  owner 'vagrant'
  group 'vagrant'
  mode '777'
end


remote_file "/tmp/kafka/kafka_2.11-0.8.2.2.tgz" do
  source "http://apache-mirror.rbc.ru/pub/apache/kafka/0.8.2.2/kafka_2.11-0.8.2.2.tgz"
  owner 'vagrant'
  group 'vagrant'
  mode '777'
end

execute 'kafka' do
  cwd "/tmp/kafka/"
  command 'tar -xzf kafka_2.11-0.8.2.2.tgz'
end
execute 'zookeeper-server-start' do
  cwd "/tmp/kafka/kafka_2.11-0.8.2.2"
  command 'bin/zookeeper-server-start.sh config/zookeeper.properties &'
end
execute 'kafka-server-start' do
  cwd "/tmp/kafka/kafka_2.11-0.8.2.2"
  command 'JMX_PORT=9997 bin/kafka-server-start.sh config/server.properties &'
end
