# This file was generated, do not modify it. # hide
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