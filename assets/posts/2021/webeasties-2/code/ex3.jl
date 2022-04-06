# This file was generated, do not modify it. # hide
paths = readdir(htmlout, join=true)

stuff = getcontent(last(paths))
print(first(stuff.content, 1000), "...")