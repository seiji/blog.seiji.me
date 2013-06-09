---
layout: post
title: "mongoimport using jsawk"
date: 2012-07-12 00:17
comments: true
categories: 
- mongoDB
description: 
keywords: 
- mongoDB
- jsawk
---

e.g. githubapi -> mongoDB

{% codeblock %}
$ curl -u "$username:$password" https://api.github.com/legacy/repos/search/:rubymotion | jsawk "return this.repositories" | mongoimport -d github -c rubymotion
{% endcodeblock %}
