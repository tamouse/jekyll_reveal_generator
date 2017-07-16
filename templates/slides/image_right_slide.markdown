---
layout: slide
title: "<%= init_options.title %>"
slug: "<%= init_options.slug %>"
group: <%= init_options.group %>
sequence: <%= init_options.sequence %>
image:
  src: "http://fillmurray.com/g/200/300"
  alt: "fill murray 200x300"
  title: "It's Fill Murray! 200 by 300"

---


### {{ page.title }}

<div class="two-up">
<div class="left">

* one
* two
* three

</div>
<div class="right">

![{{ page.image.alt }}]({{ page.image.src}} "{{page.image.title }}")

{{page.image.title}}

</div>
</div>
