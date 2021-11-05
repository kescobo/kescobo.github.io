# This file was generated, do not modify it. # hide
using EzXML

function gettags(body)
    tags = String[]
    tagnodes = findall(".//div[@class=\"field--item\"]", body)
    for tagnode in tagnodes
        a = findfirst("./a[@href]", tagnode)
        link = first(attributes(a)).content
        m = match(r"^/tag/([\w\-]+)$", link)
        isnothing(m) && continue
        push!(tags, m.captures[1])
    end
    return tags
end

function getcontent(path)

    post = readhtml(path)
    doc = root(post)
    title = findall("//title", doc) # could have done `findfirst` instead, but then couldn't check if it's unique
    length(title) != 1 && error("Expected only 1 title block, got $(length(title)) from $p")
    title = first(title) |> nodecontent # get it out of the array

    body = findall("//div[@class=\"content\"]", doc)
    length(body) != 1 && error("Expected only 1 content block, got $(length(body)) from $path")
    body = first(body)

    tags = gettags(body)
    content = body.content
    links = findall(".//a[@href]", body)
    imgs = findall(".//img", body)

    return (; path, content, title, post, links, tags, imgs)
end