# This file was generated, do not modify it. # hide
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