# This file was generated, do not modify it. # hide
using EzXML

paths = readdir(htmlout, join=true)
p = first(paths) # for p in paths

post = readhtml(p)
doc = root(post)
# ...

# end