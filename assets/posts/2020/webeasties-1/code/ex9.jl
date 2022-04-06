# This file was generated, do not modify it. # hide
post = findfirst("./div", body)
links = findall(".//a[@href]", post)

length(links)