+++
title = "We, Beasties recovery - Part 2"
pubdate = Date("2021-11-06")
category = "code"
showall = true
tags = ["microbiology","web", "julia"]
img = "/assets/img/sciblogs-logo.jpeg"
math = false
+++

Hey, it only took me 2 years to [get back to this](/posts/2020/webeasties-1)!
Let's jump right in.

## Previously...

At the end of the last post,
I had downloaded all of the html files
from my [old blog, _We, Beasties_](https://scienceblogs.com/webeasties),
and pulled out the titles, dates, content (including links), and tags.

Now, I'd like to parse those and (crudely)
turn them into markdown that can be built by [`Franklin.jl`](http://franklinjl.org).

\literate{webeasties/part2.jl}

