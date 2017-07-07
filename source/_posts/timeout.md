---
title: $timeout is the saviour
date: 2017-06-10 14:43:46
tags:
- angular.js
- $timeout
---

Hmm, we all know that Angular Js has this awesome 2 way data binding feature that is boasted almost everywhere! But you know what this 2 way data binding works on its own through a **digest** cycle as they call it. As you dig deeper and mess your hands in Angular, you will start to do things that will do something like this( This is what happened with me)😝:

I had this great angular component for doing some changes with the variable **step**.

[$ctrl.step == 'upload'](https://krshubham.github.io/images/$timeout1.png)

What happened was on $onInit the variable was being set to upload, that's cool and as expected behaviour. But, later I noticed that when I changed the value of this variable, it did not get updated with the view and left everything still 😰.

Fortunately after a bit of googling, I came to know that the change being done to the variable must be told to angular in the following two ways (what I found):

```
$scope.$apply(()=>{
	//do whatever
});
```

Or we can use ``` $timeout() ``` instead of using the above piece of code. **$timeout** behind the scenes call $apply anyhow, so its the above piece of code which comes to the rescue. It was a bit weird for me getting stuck like this, because I did not face any problems like that before. Well, lets see what's more hidden in Angular!

Hop on to comments for some chit chat!

<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
     style="display:block; text-align:center;"
     data-ad-format="fluid"
     data-ad-layout="in-article"
     data-ad-client="ca-pub-3900805761322774"
     data-ad-slot="1286488845"></ins>
<script>
     (adsbygoogle = window.adsbygoogle || []).push({});
</script>

