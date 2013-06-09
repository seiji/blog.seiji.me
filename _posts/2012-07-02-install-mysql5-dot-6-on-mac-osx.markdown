---
layout: post
title: "Install mysql5.6 on Mac OSX"
date: 2012-07-02 15:57
comments: true
categories: 
- MySQL
description: 
keywords: 
- MySQL

---

{% codeblock %}
$ sw_vers
ProductName:    Mac OS X
ProductVersion: 10.7.4
BuildVersion:   11E2705

// Install googletest
brew install gtest

// Download src
$ wget -O mysql-5.6.5-m8.tar.gz http://dev.mysql.com/get/Downloads/MySQL-5.6/mysql-5.6.5-m8.tar.gz/from/http://ftp.iij.ad.jp/pub/db/mysql/
$ tar -zxf mysql-5.6.5-m8.tar.gz

// Apply patch
// http://lists.mysql.com/commits/143611
// http://lists.mysql.com/commits/143681

// Compile
$ cmake .
$ make && sudo make install

// Setting
$ sudo chown -R mysql:mysql /usr/local/mysql/
$ sudo cp support-files/my-large.cnf /etc/my.cnf
$ sudo sh ./scripts/mysql_install_db --user=mysql --basedir=/usr/local/mysql  --datadir=/usr/local/mysql/data
$ sudo /usr/local/mysql/bin/mysqld_safe &

$ /usr/local/mysql/bin/mysql -u root
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 1
Server version: 5.6.5-m8-log Source distribution

{% endcodeblock %}

