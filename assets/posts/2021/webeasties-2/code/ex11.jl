# This file was generated, do not modify it. # hide
mdoutput = mktempdir()

mdoutput = "webeasties"
isdir(mdoutput) || mkdir(mdoutput)

for p in paths
    @info p
    post = getcontent(p)
    post_text = replace(post.content, r"(\S)\n(\S)"=> s"\1\n\n\2") # replace stand-alone new lines with doubles
    post_text = replace(post_text, r"\n+\s{4}Tags\n.+$"s=>"") # replace garbage at the end of each post
    post_text = replace(post_text, '$'=> raw"\$") # franklin doesn't like these
    post_text = replace(post_text, r"^\s{4,}"=> "") # remove leading spaces
    post_text = replace(post_text, r"\n{3,}"s=> "\n\n") # remove anything more than 3 newlines
    post_text = make_md_links(post_text, post.links)
    post_text = append_image_links(post_text, post.links, post.imgs)


    (y, m, d, postfile) = match(r"^(\d{4})(\d{2})(\d{2})_(.+)", basename(post.path)).captures

    t = replace(post.title, r" \| ScienceBlogs$"=>"")
    t = replace(t, '"'=> "'")
    outdir = joinpath(mdoutput, y)
    isdir(outdir) || mkdir(outdir)

    open(joinpath(mdoutput, y, replace(postfile, r"html?$"=>"md")), "w") do io
        print(io, """
        +++
        title = "$t"
        pubdate = Date("$y-$m-$d")
        tags = $(post.tags)
        category = "webeasties"
        +++

        _This post initially appeared on [Science Blogs](http://scienceblogs.com/webeasties)_

        $post_text
        """)
    end
end