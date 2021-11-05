# This file was generated, do not modify it.

projectdir = joinpath(pwd(), "_literate", "webeasties")

using Pkg #hide
Pkg.activate(projectdir) #hide
Pkg.instantiate() #hide

using Downloads: download

posturls = Set(String[])
baseurl = "https://scienceblogs.com/author/kbonham?page="

# for p in 0:7
for p in 0:0
    tmp = download(baseurl*string(p))
    for line in eachline(tmp)
        for m in eachmatch(r"href=\"(/webeasties[\w/\-]+)\"", line)
           push!(posturls, m[1])
        end
    end
end

first(posturls, 5)

length(posturls) # for the full set, this is 191

htmlout = joinpath(projectdir, "html_out")
isdir(htmlout) || mkdir(htmlout)

# this post wasn't available anymore, so I removed it
setdiff!(posturls, Set(["/webeasties/2010/12/26/weekend-review-all-about-the-g"]))
posturls

for url in posturls
    m = match(r"^/webeasties/(\d{4}/\d{2}/\d{2})/([\w/\-]+)$", url)
    isnothing(m) && error("url $url doesn't match")
    dt, title = m.captures
    dt = replace(dt, '/'=>"") # remove /, so eg 2013/01/25 becomes 20130125
    file = "$(dt)_$title.html"

    # skips files that already exist since I ran into some errors, I didn't want to re-do them
    isfile(joinpath(htmlout, file)) || download("https://scienceblogs.com" * url, joinpath(htmlout, file))
    sleep(0.1)
end

using EzXML

paths = readdir(htmlout, join=true)
p = first(paths) # for p in paths

post = readhtml(p)
doc = root(post)
# ...

# end

title = findall("//title", doc) # could have done `findfirst` instead, but then couldn't check if it's unique
length(title) != 1 && error("Expected only 1 title block, got $(length(title)) from $p")
title = first(title) # get it out of the array

title.content

body = findall("//div[@class=\"content\"]", doc)
length(body) != 1 && error("Expected only 1 content block, got $(length(body)) from $p")
body = first(body)

body.content

links = findall(".//a[@href]", body)

length(links)

post = findfirst("./div", body)
links = findall(".//a[@href]", post)

length(links)

post.content # this ends up being a little nicer too

function gettags(body)
    tags = String[]
    tagnodes = findall(".//div[@class=\"field--item\"]", body)
    for tagnode in tagnodes
        a = findfirst("./a[@href]", tagnode)
        link = first(attributes(a)).content
        m = match(r"^/tag/([\w\-]+)$", link)
        isnothing(m) && error("Expected tag, got $link")
        push!(tags, m.captures[1])
    end
    return tags
end

gettags(body)

