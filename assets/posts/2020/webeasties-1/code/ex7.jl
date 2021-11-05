# This file was generated, do not modify it. # hide
body = findall("//div[@class=\"content\"]", doc)
length(body) != 1 && error("Expected only 1 content block, got $(length(body)) from $p")
body = first(body)

body.content