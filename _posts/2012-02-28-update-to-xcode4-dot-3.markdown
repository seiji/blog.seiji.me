---
layout: post
title: "Upgrade to XCode 4.3"
date: 2012-02-28 01:45
comments: true
categories: 
- iOS
description: 
keywords: 
- iOS

---

{% codeblock %}

// Install OSX 10.7.3
// Install Xcode4.3
// open Xcode4.3 to remove /Developper
$ sudo /Developer/Library/uninstall-devtools --mode=all
$ sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
$ xcode-select -print-path
/Applications/Xcode.app/Contents/Developer
$ xcodebuild -version
Xcode 4.3
Build version 4E109

{% endcodeblock %}
