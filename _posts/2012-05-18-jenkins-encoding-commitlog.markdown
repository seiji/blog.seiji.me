---
layout: post
title: "git commit Logの文字化け対応 - Jenkins"
date: 2012-05-18 10:47
comments: true
categories:
- Jenkins
description:
keywords: 
- Jenkins
- git
- homebrew
---

{% codeblock %}
$ vi  ~/Library/LaunchAgents/homebrew.mxcl.jenkins.plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>Label</key>
    <string>homebrew.mxcl.jenkins</string>
    <key>ProgramArguments</key>
    <array>
      <string>/usr/bin/java</string>
      <string>-Xmx512m</string> 
      <string>-Dfile.encoding=UTF-8</string>
      <string>-jar</string>
      <string>/usr/local/lib/jenkins.war</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>KeepAlive</key>
    <true/>
  </dict>
</plist>

{% endcodeblock %}
