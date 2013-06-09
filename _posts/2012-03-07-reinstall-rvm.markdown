---
layout: post
title: "reinstall rvm"
date: 2012-03-07 15:41
comments: true
categories: 
- Ruby
description: 
keywords:
- Ruby
---

## reinstall rvm
{% gist 1991442 %}

## fsevent/fsevent_watch.c:1:10: fatal error: 'stdio.h' file not found
{% codeblock %}
$ vi Gemfile
>>
- gem 'rb-fsevent',
+ gem 'rb-fsevent', :git => 'git://github.com/ttilley/rb-fsevent.git', :branch => 'pre-compiled-gem-one-off'
{% endcodeblock %}

referrel  
[https://github.com/thibaudgg/rb-fsevent/issues/20#issuecomment-1814363](https://github.com/thibaudgg/rb-fsevent/issues/20#issuecomment-1814363)

