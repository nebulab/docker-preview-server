#
# Cookbook Name:: docker-preview-server
# Recipe:: default
#

docker_service 'default' do
  action [:create, :start]
end

docker_volume 'portainer_data' do
  action :create
end

docker_container 'portainer' do
  repo 'portainer/portainer'
  action :run
  restart_policy 'always'
  port '9000:9000'
  volumes [
    '/var/run/docker.sock:/var/run/docker.sock',
    'portainer_data:/data'
  ]
end

docker_container 'nginx-proxy' do
  repo 'jwilder/nginx-proxy'
  action :run
  restart_policy 'always'
  port ['80:80', '443:443']
  volumes [
    '/etc/nginx/certs',
    '/etc/nginx/vhost.d',
    '/usr/share/nginx/html',
    '/var/run/docker.sock:/var/run/docker.sock:ro'
  ]
end

docker_container 'nginx-proxy-ssl-companion' do
  repo 'jrcs/letsencrypt-nginx-proxy-companion'
  action :run
  restart_policy 'always'
  volumes_from 'nginx-proxy'
  volumes ['/var/run/docker.sock:/var/run/docker.sock:ro']
end
