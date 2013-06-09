---
layout: post
title: "ios-utf8mb4-substring"
date: 2012-11-06 21:34
comments: true
categories: 
- iOS
description: 
keywords: 
- iOS
---

Use this function incase of including utf8mb4(emoji)

{% codeblock %}
- (void)enumerateSubstringsInRange:(NSRange)range
                           options:(NSStringEnumerationOptions)opts
                        usingBlock:(void (^)(NSString *substring,
                                             NSRange substringRange,
                                             NSRange enclosingRange,
                                             BOOL *stop))block
{% endcodeblock %}
