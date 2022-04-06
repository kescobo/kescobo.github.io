# This file was generated, do not modify it. # hide
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