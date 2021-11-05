# This file was generated, do not modify it. # hide
title = findall("//title", doc) # could have done `findfirst` instead, but then couldn't check if it's unique
length(title) != 1 && error("Expected only 1 title block, got $(length(title)) from $p")
title = first(title) # get it out of the array

title.content