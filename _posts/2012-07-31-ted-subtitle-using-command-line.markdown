---
layout: post
title: "TED subtitle using command line"
date: 2012-07-31 16:23
comments: true
categories: 
- TED
description: 
keywords:
- TED
---

{% codeblock %}
curl http://www.ted.com/talks/subtitles/id/$ID/lang/en | jsawk "return this.captions" | jsawk "return this.content" | jsawk -a 'return this.join(" ")'
{% endcodeblock %}
