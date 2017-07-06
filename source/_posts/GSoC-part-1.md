---
title: GSoC'17 First Evaluation
date: 2017-06-29 12:13:24
tags:
- GSoC17
- Berkman Center
- Teem
---

### The three goals

Hi there, this blog post marks the progress that I have done during the first evaluation period of Google Summer of Code 2017.

I had **three goals** in my Google Summer of Code 2017 proposal:

+ Develop a link preview system for the annotations in Teem
+ Integrating Trello with the needs
+ Improving the SEO performance of projects in Teem for better social sharing

For the first working period I started working on the link preview system which had to show link previews when a hover event occurs on a link annotation. Annotations are a part of [SwellRT](https://swellrt.teem.works) which allow us to make links in the Teem pad.

### What to do
So as we see in facebook or twitter, whenever we hover on a link a popup comes up with some rich information about the given link. All this data is basically the [opengraph](http://http://ogp.me/) metadata or if not then some data scraped from the innerHTML of the page! I had to do this work on a mouse over on the link annotation.

### How to do
I had some discussion with my mentor, taking a slight hitch, I would like to say that my mentor is really a cool person, who always comes up with some cool ideas that always help me when I am stuck. We have daily conversations at 17:00 PM Madrid time to discuss the progress and its simply going great! Thank you so much [Antonio](https://github.com/atfornes).
Alright, coming back to the topic, we decided to have an independent node server running as a docker application that would do all the scraping part and will send this data back to the client.

### The result
Having done the above discussed work, I just worked a bit on the frontend part of this and below are some images showing the final output:
![Part 2](https://krshubham.github.io/images/gsoc-part-1_2.png "Link annotation loading")
![Part 1](https://krshubham.github.io/images/gsoc-part-1_1.png "Link annotation preview")

Hope you guys enjoyed this post! What are you guys doing this summer?
Hop on to comments for some chit chat!