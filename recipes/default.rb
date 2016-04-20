#
# Cookbook Name:: manage-kafka
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe "java"
include_recipe "kafka-manager::kafka_install" if node['kafka-manager']['testing']
include_recipe "kafka-manager::install"
include_recipe "kafka-manager::config"
