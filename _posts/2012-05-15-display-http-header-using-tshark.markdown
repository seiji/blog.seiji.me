---
layout: post
title: "display http header Using tshark"
date: 2012-05-15 20:28
comments: true
categories: 
- tshark
description:
keywords: 
- tshark
---

{% codeblock %}
$ sudo tshark -V -R "http.request" -i lo0 port 80 
>>
    [Calculated window size: 81660]
    [Window size scaling factor: 2]
    Checksum: 0xfe28 [validation disabled]
        [Good Checksum: False]
        [Bad Checksum: False]
    Options: (12 bytes)
        No-Operation (NOP)
        No-Operation (NOP)
        Timestamps: TSval 664148220, TSecr 664148220
            Kind: Timestamp (8)
            Length: 10
            Timestamp value: 664148220
            Timestamp echo reply: 664148220
[2 Reassembled TCP Segments (132 bytes): #16(132), #20(0)]
    [Frame: 16, payload: 0-131 (132 bytes)]
    [Frame: 20 (no data)]
    [Segment count: 2]
    [Reassembled TCP length: 132]
Hypertext Transfer Protocol
    POST /data/post HTTP/1.1\r\n
        [Expert Info (Chat/Sequence): POST /data/post HTTP/1.1\r\n]
            [Message: POST /data/post HTTP/1.1\r\n]
            [Severity level: Chat]
            [Group: Sequence]
        Request Method: POST
        Request URI: /data/post
        Request Version: HTTP/1.1
    Accept: */*\r\n
    User-Agent: Ruby\r\n
    Content-Type: multipart/form-data; boundary=myboundary\r\n
    Host: localhost\r\n
    \r\n
    [Full request URI: http://localhost/data/post]

{% endcodeblock %}
