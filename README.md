# docker-preview-server Cookbook

This cookbook will let you configure a server to spin up Docker to run preview
QA containers for applications.

This is part of the work needed to spin up 1-container preview applications
(like Heroku does for PRs).

Even if unrelated to this particular repository there are multiple components
involved:

* https://github.com/nebulab/baywatch
* https://circleci.com/orbs/registry/orb/nebulab/feature-branch-preview

## Requirements

This is meant to run on Opsworks... so it's limited to Chef v12.

## Usage

Just include `docker-preview-server` in your node's `run_list`.

This will run the following containers:

* [dockerd](https://docs.docker.com/engine/reference/commandline/dockerd/)
* [portainer](https://www.portainer.io)
* [nginx-proxy](https://github.com/jwilder/nginx-proxy)
* [docker-letsencrypt-nginx-proxy-companion](https://github.com/JrCs/docker-letsencrypt-nginx-proxy-companion)

## About

[![Nebulab][nebulab-logo]][nebulab]

docker-preview-server is funded and maintained by the [Nebulab][nebulab] team.

We firmly believe in the power of open-source. [Contact us][contact-us] if you
like our work and you need help with your project design or development.

[nebulab]: https://nebulab.it/
[nebulab-logo]: https://nebulab.it/assets/images/public/logo.svg
[contact-us]: https://nebulab.it/contact-us/
