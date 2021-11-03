md"""
## Converting html to markdown

I already figured out how to get all of the elements out of the HTML,
now it's just a matter of making them into markdown.

Let's review
"""

projectdir = joinpath(pwd(), "_literate", "webeasties")
htmlout = joinpath(projectdir, "html_out/")

using Pkg #hide
Pkg.activate(projectdir) #hide
Pkg.instantiate() #hide

#-

using EzXML

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

function getcontent(path)

    post = readhtml(path)
    doc = root(post)
    body = findall("//div[@class=\"content\"]", doc)
    length(body) != 1 && error("Expected only 1 content block, got $(length(body)) from $path")
    body = first(body)
    
    tags = gettags(body)
    content = body.content
    links = findall(".//a[@href]", body)
    imgs = findall(".//img", body)

    return (; path, content, post, links, tags, imgs)
end

#-

paths = readdir(htmlout, join=true)

stuff = getcontent(last(paths))
print(first(stuff.content, 1000), "...")

#-

first(stuff.links, 4)

#-

stuff.tags

md"""
This the [last post](https://scienceblogs.com/webeasties/2013/09/03/we-beasties-sproulates)
I made on the blog in 2013.
It's got some pictures and a bunch of links, but not much other formatting,
so should be pretty straightforward.

The first thing I decided to tackle was how to deal with the links...
"""
md"""
### Link nodes

Looking inside the contents of each element of `links`,
it looks like all of the useful info I need is there:
"""
link = stuff.links[2]
nodecontent(link)
#-
nodecontent(first(attributes(link)))

md"""
So all I need to do to start building the markdown is to find the text
inside `stuff.content`, and replace it with a markdown link.
Eg, `Paul de Kruif's` will become `[Paul de Kruif's](http://www.amazon...)`.

This is easily done with julia's `replace()` function.
"""

function make_md_links(content, links)
    for lnk in links
        repstring = nodecontent(lnk)
        link = nodecontent(first(attributes(lnk)))
        isempty(repstring) && continue # first link doesn't have anything in it
        any(ext -> endswith(link, ext), [".png", ".jpeg", ".jpg"]) && continue # skip images
        content = replace(content, repstring=> 
                                   string("[", repstring, "](", link, ")"),
                                   count=1)
    end
    return content
end

linkified = make_md_links(stuff.content, stuff.links)
print(first(linkified, 500), "...")

md"""
Easy!

Much harder is dealing with images.
When I was blogging back then, I didn't understand the importance
(for accessibility) of including link text,
so most image links are going to have empty content.

But I don't really need to reproduce these posts exactly,
so I settled on just downloading the images (if they exist)
and putting them all at the end.
"""


function append_image_links(content, links, imgs)
    ## don't proceed if there are no image links
    if isempty(imgs) && !any(lnk-> any(ext -> endswith(nodecontent(first(attributes(lnk))), ext), [".png", ".jpeg", ".jpg"]), links)
        return content
    end

    content *= string("\n\n ## Post Images\n\n")
    for lnk in links
        alttext = nodecontent(lnk)
        link = nodecontent(first(attributes(lnk)))
        isempty(alttext) && (alttext = string("Image at $link"))
        if any(ext -> endswith(link, ext), [".png", ".jpeg", ".jpg"])

            targetpath = joinpath("_assets", "img", "webeasties", basename(link))
            if !isfile(targetpath) # skip if already downloaded
                download(link, targetpath)
            end

            content *= string("- ", "![", alttext, "](/", targetpath, ")\n")
        end
    end

    for img in imgs
        link = findall(".//@src", img) |> first |> nodecontent
        alttext = findall(".//@alt", img) |> first |> nodecontent
        if startswith(link, "/files/")
            targetpath = joinpath("_assets", "img", "webeasties", basename(link))

            if !isfile(targetpath) # skip if already downloaded
                download(string("https://scienceblogs.com", link), targetpath)
            end
            content *= string("- ", "![", alttext, "](/", targetpath, ")\n")
        end
    
    end
    return content
end

with_images = append_image_links(linkified, stuff.links, stuff.imgs)

print(last(with_images, 300))
