# This file was generated, do not modify it. # hide
function append_image_links(content, links, imgs)
    # don't proceed if there are no image links
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
                try
                    download(link, targetpath)
                catch
                    @error "Couldn't download $link, skipping"
                end
            end
            if !isfile(targetpath)
                content *= string("- ", "![", alttext, "](/", targetpath, ")\n")
            else
                content *= string("- Missing image: ", alttext, " | ", link, "\n")
            end
        end
    end

    for img in imgs
        link = findall(".//@src", img) |> first |> nodecontent
        alttext = findall(".//@alt", img)
        alttext = isempty(alttext) ? "image at $link" : alttext |> first |> nodecontent
        if startswith(link, "/files/")
            targetpath = joinpath("_assets", "img", "webeasties", basename(link))

            if !isfile(targetpath) # skip if already downloaded
                download(string("https://scienceblogs.com", link), targetpath)
            end
            content *= string("- ", "![", alttext, "](/", targetpath[2:end], ")\n")
        end

    end
    return content
end