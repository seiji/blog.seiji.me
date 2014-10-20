---
layout: post
title: Docker excludes files when sending to its daemon
date: 2014-06-28
comments: true
categories:
- Docker
description:
tags:
excerpt:
keywords:
- Docker

---

It seems that this feature is supported. [Rebased Dockerignore](https://github.com/dotcloud/docker/pull/6579)

### Add Dockerfile

{% codeblock %}

$ cat Dockerfile
FROM centos:6.4

{% endcodeblock %}


### Add ignore files 

{% codeblock %}

$ cat .dockerignore
.bundle
.git
log
tmp
vendor

{% endcodeblock %}

### Build image

{% codeblock %}

$ time docker build -t centos:noignore .  
Sending build context to Docker daemon 165.4 MB
Sending build context to Docker daemon
Step 0 : FROM centos:6.4
 ---> 539c0211cd76
Successfully built 539c0211cd76
docker build -t centos:noignore .  4.09s user 2.68s system 32% cpu 20.804 total

$ time docker-1.0.1-dev build -t centos:ignore
Sending build context to Docker daemon  1.46 MB
Sending build context to Docker daemon 
Step 0 : FROM centos:6.4
 ---> 539c0211cd76
Successfully built 539c0211cd76
docker-1.0.1-dev build -t centos:ignore .  2.23s user 0.34s system 91% cpu 2.824 total

{% endcodeblock %}

### Appendix

#### Setting Up a Dev Environment on OSX

{% codeblock %}

$ git clone https://git@github.com/dotcloud/docker

$ cd docker

$ make build

$ export DOCKER_CLIENTONLY=1 

$ export AUTO_GOPATH=1

$ hack/make.sh dynbinary

{% endcodeblock %}
