# This file was generated, do not modify it. # hide
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