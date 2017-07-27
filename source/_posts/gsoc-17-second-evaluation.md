---
title: GSoC'17 Second Evaluation
date: 2017-07-26 12:27:47
tags:
- GSoC17
- Berkman Center
- Teem
---

After successfully passing the first evaluations, I began working on the second goal of my proposal which can be stated as:

> To enable sharing of the teem pages and allow proper crawling of the pages for improved contextual link previews in other sites

### Challenges to solve:

We know that now-a-days the entire web is focused around Single Page Applications also known as **SPA**. The good point about these single page applications is that they are fast and make your webpage feel as if it were a mobile app. Its good as long as we don't consider the following penalties:

+ A single page application requires a lot of javascript to run, since its is the one doing everything from routing to fetching the content and templates to rendering the changes into the DOM.
+ The overall fluidity comes after a longer initial website load time, since there are many resources to be fetched (especially js files).
+ The worst part is the fact that most of the web crawlers are not capable of executing javascript code while crawling the page and thus what they get is a page that has no useful data.

Teem is a web application built entirely on top of Angular 1. Angular 2 and solve this problem of SEO by implementing something known as **Server Side Rendering(SSR)**. But Angular 1 doesn't support this capability natively.

Teem was already having a [prerender](https://prerender.io/) server setup through a docker container [here](https://github.com/P2Pvalue/docker-prerender) . I first started inspecting why it was not working. The problem with prerender is that it has a variable named as window.prerenderReady which when becomes true , prerender thinks that the site is now ready to be given back to the crawler. In our case, we had to establish a protected websocket connection and a session with the swellRT server so prerender did not wait for it and hence did not work.

Actually the values of metadata such as ```og:title``` or ```og:description``` were set using a property assigned to the ```$rootScope``` . The variable was available only after a session with the server is established and hence in environments where the timeout is very low for crawling these js pages, its not possible.

A lot of my time was spent on finding the proper solution. The SwellRT API is provided in javascript and requires browser like environment to run properly.

### Proposing various solutions

+ I simply started using phantomjs and thought that it whenever the request would come to teem I'd redirect to a separate node server that would use phantomjs to render the page and then send the data using it. But the problem was that phantomjs onload event when once fired the page did not load further. This approach also didn't seem to work properly and consistently.
+ Finally after some time I thought, to have a look at the **Networks** tab in the console and checked what were the API end points hit by the swellRT js API . After taking a look on this I went on to propose a solution which seemed to work.

### The final solution
After referring to a lot of the wiki and documentation that swellRT had and also getting help from my mentor [Antonio](https://github.com/atfornes), I finally decided to simply use my node server as a proxy between the SwellRT server for teem and the web crawler.

Here is a brief flow of how the solution works:

+ The crawler hits the teem url ```/teems/:teemId```
+ The User agent is checked in the nginx configuration file and then accordingly is redirected to the proxy server running on a separate port.
+ The proxy docker container then establishes an anonymouse session and with the given ```teemId```, it queries the SwellRT server for the data regarding the project.
+ Once the data is returned we use [mustache](https://www.npmjs.com/package/mustache) to compile the template with the given data model.
+ This compiled html page is now returned to the crawlers and thus they are able to get the opengraph meta data.

Here is a [link](https://github.com/krshubham/teem-link-preview) to server that I have implemented for this purpose.

It was really a nice and interesting problem to solve. As of now, I am looking forward to solve another challenging goal, which is to integrate trello with Teem.

A nice summer going on! Hop on to comments for queries!

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





