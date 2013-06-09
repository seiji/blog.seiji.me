---
layout: post
title: "iOS Application Security"
date: 2012-11-23 15:16
comments: true
categories: 
- iOS
description: 
keywords: 
- iOS
---

### Distribution file
    
- Check your ipa or archive file for distribution

### Application Data (Documents, Library, tmp)

- Use "Data protection API"

- Check this files

  - plain SQLite file

  - plain UserDefaults plist

  - archived file by NSKeyedArchiver 

      better using custom class

  - UIWebview Cache

      is saved url, response, blob data

### HTTPS
  
### URL Schema

### UIWebView

### Screenshot Backgrounding (Library/Caches/Snapshots)

  - Hide sensitive screen before moving it to the background

Reference
[Top 5 iOS Application Security Flaws](http://palizine.plynt.com/issues/2011Dec/ios-app-flaws/)
