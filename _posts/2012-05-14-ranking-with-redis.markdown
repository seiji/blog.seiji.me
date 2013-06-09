---
layout: post
title: "Ranking in Redis Sorted Set"
date: 2012-05-14 15:36
comments: true
categories: 
- Ruby
- Redis
description: 
keywords: 
- Ruby
- Redis
---

## Precondition
Rows : 1,000,000

Score: rand(1..100)

## RedisのSorted Setを使用し、Top10と自分を含む前後5人のランキングを表示する
{% gist 2692190 %}
