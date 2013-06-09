---
layout: post
title: "Using mongo-hadoop"
date: 2012-07-04 15:53
comments: true
categories: 
- mongoDB
- Hadoop
description: 
keywords: 
- mongoDB
- Hadoop
---

## install hadoop 0.23.0
{% codeblock %}

$ cd /usr/local
$ wget http://ftp.tsukuba.wide.ad.jp/software/apache/hadoop/common/hadoop-0.23.0/hadoop-0.23.0.tar.gz
$ tar -zxf hadoop-0.23.0.tar.gz
$ ln -s hadoop-0.23.0 hadoop

$ echo "log4j.appender.NullAppender=org.apache.log4j.varia.NullAppender" >> /usr/local/hadoop/etc/hadoop/log4j.properties

$ hadoop version
Hadoop 0.23.0
Subversion git://devadm900.cc1.ygridcore.net/grid/0/dev/acm/hadoop-trunk/hadoop-common-project/hadoop-common -r d4fee83ec1462ab9824add6449320617caa7c605
Compiled by hortonmu on Thu Nov  3 08:59:12 UTC 2011
From source with checksum 4e42b2d96c899a98a8ab8c7cc23f27ae

{% endcodeblock%}

## create mongo-hadoop-streaming-assembly-*.jar
{% codeblock %}
$ hub clone mongodb/mongo-hadoop
$ cd mongo-hadoop
$ vi build.sbt 
- hadoopRelease in ThisBuild := "default"
+ hadoopRelease in ThisBuild := "0.23.x"
$ ./sbt mongo-hadoop-streaming/assembly
$ ls -la streaming/target/mongo-hadoop-streaming-assembly-*.jar
{% endcodeblock %}

## test sample
### test data
{% codeblock %}
$ curl https://stream.twitter.com/1/statuses/sample.json -u<login>:<password> | mongoimport -d twitter -c in
{% endcodeblock %}

### mapper.rb
{% gist 3045943 %}
### reducer.rb
{% gist 3045945 %}

### execute
{% codeblock %}
$ hadoop jar mongo-hadoop-streaming-assembly*.jar -mapper mapper.rb -reducer reducer.rb -inputURI mongodb://127.0.0.1/twitter.in -outputURI mongodb://127.0.0.1/twitter.out
{% endcodeblock %}

### result
{% codeblock %}
$ mongo twitter
MongoDB shell version: 2.0.6
connecting to: twitter
> db.out.find().sort({count:-1})
{ "_id" : "Unknown", "count" : 962 }
{ "_id" : "Tokyo", "count" : 339 }
{ "_id" : "Pacific Time (US & Canada)", "count" : 302 }
{ "_id" : "Central Time (US & Canada)", "count" : 289 }
{ "_id" : "Quito", "count" : 203 }
{ "_id" : "Hawaii", "count" : 193 }
{ "_id" : "Eastern Time (US & Canada)", "count" : 176 }
{ "_id" : "Brasilia", "count" : 137 }
{ "_id" : "Jakarta", "count" : 127 }
{ "_id" : "Santiago", "count" : 117 }
{ "_id" : "Greenland", "count" : 116 }
{ "_id" : "Alaska", "count" : 101 }
{ "_id" : "Mountain Time (US & Canada)", "count" : 81 }
{ "_id" : "Amsterdam", "count" : 78 }
{ "_id" : "London", "count" : 74 }
{ "_id" : "Bangkok", "count" : 67 }
{ "_id" : "Atlantic Time (Canada)", "count" : 48 }
{ "_id" : "Irkutsk", "count" : 43 }
{ "_id" : "Kuala Lumpur", "count" : 39 }
{ "_id" : "Singapore", "count" : 38 }
has more
{% endcodeblock %}

* [Hadoop Streaming Support for MongoDB](http://blog.mongodb.org/post/24610529795/hadoop-streaming-support-for-mongodb)
