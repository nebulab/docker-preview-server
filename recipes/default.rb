#
# Cookbook Name:: docker-preview-server
# Recipe:: default
#

docker_service 'default' do
  action [:create, :start]
end
