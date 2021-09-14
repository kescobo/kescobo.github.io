@def title = "Academic template"

<!-- -----------------
     BIOGRAPHY SECTION
     ----------------- -->

\begin{section}{name="about"}

<!-- LEFT COLUMN -->
@@col-12,col-lg-4,profile

\img{"/assets/img/person.jpg", class="avatar avatar-circle", alt="Kevin Bonham"}
\portrait{
  name="Kevin Bonham",
  job="Senior Research Scientist",
  link="https://www.wellesley.edu",
  linkname="Wellesley College",
  twitter="https://twitter.com/kevbonham",
  gscholar="https://scholar.google.co.uk/citations?user=o2fUiqwAAAAJ",
  github="https://github.com/kescobo",
  linkedin="https://www.linkedin.com/in/kevin-bonham-6a10b566"
}
@@ <!-- end of column -->

<!-- RIGHT COLUMN -->
@@col-12,col-lg-8

\begin{biography}{resume="/assets/CV.pdf"}
  Kevin Bonham is a Senior Research Scientist at Wellesley College,
  studying the human microbiome and its impact on childhood cognitive development.
  In collaboration with Curtis Huttenhower, he is also developing a computational tool
  to simplify the use of Gaussian Process models in the study of longitudinal microbiome data sets.
\end{biography}

\shortcv{
  interests=["Human Microbiome", "Computational Biology", "Gaussian Processes"],
  education=[
    ("PhD in Immunology, 2014", "Harvard Graduate School of Arts and Sciences"),
    ("BSc in Biochemistry and Cell Biology, 2006", "University of California, San Diego")]
}

@@ <!-- end of column -->
\end{section}

<!-- --------------
     SKILLS SECTION
     -------------- -->

\begin{section}{name="skills", class="wg-featurette", rowclass="featurette"}

\sectionheading{"Skills", class="col-md-12"}

\skill{"Julia", "for technical computing", img="/assets/img/julia-dots.svg"}
\skill{"Data science", "Analysis, visualization", fa="chart-line"}
\skill{"Software Eng", "git, unit testing, CI", fa="code-branch"}

\end{section}


<!-- ------------------
     EXPERIENCE SECTION
     ------------------ -->

\begin{section}{name="experience"}

\sectionheading{"Experience", class="col-12 col-lg-4"}

@@col-12,col-lg-8

\experience{
  title="CEO",
  company="GenCoin",
  descr="""
    Responsibilities include:
    * Analysing
    * Modelling
    * Deploying
    """,
  from="Jan 2017",
  to="Present",
  location="California",
  active=true
  }
\experience{
  title="Professor",
  company="University X",
  from="Jan 2016",
  to="Dec 2016",
  location="California",
  descr="Taught electronic engineering and researched semiconductor physics."
  }

@@

\end{section}

<!-- -----------------------
     ACCOMPLISHMENTS SECTION
     ----------------------- -->

\begin{section}{name="accomplishments"}

\sectionheading{"Accomplish­ments", class="col-12 col-lg-4"}

@@col-12,col-lg-8

\certificate{
  title="Neural Networks and Deep Learning",
  meta="Coursera",
  metalink="https://www.coursera.org",
  date="Oct 2018",
  certlink="https://www.coursera.org"
  }
\certificate{
  title="Blockchain Fundamentals",
  descr="Formulated informed **blockchain** models, hypotheses, and use cases.",
  meta="Coursera",
  metalink="https://www.edx.org",
  date="Mar 2018",
  certlink="https://www.edx.org"
  }
\certificate{
  title="Object-Oriented Programming in R: S3 and R6 Course",
  meta="DataCamp",
  metalink="https://www.datacamp.com",
  date="Jul 2017 – Dec 2017",
  certlink="https://www.datacamp.com"
}

@@

\end{section}

<!-- --------------------
     RECENT POSTS SECTION
     -------------------- -->

\begin{section}{name="posts", class="wg-pages"}

\sectionheading{"Recent Posts", class="col-12 col-lg-4"}

@@col-12,col-lg-8

{{recentposts 5}}

@@

\end{section}

<!-- -----------------
     PORTFOLIO SECTION XXX
     ----------------- -->

<!-- -------------
     TALKS SECTION XXX
     ------------- -->

<!-- --------------------
     FEATURED PUB SECTION XXX
     -------------------- -->

<!-- ---------------------------
     RECENT PUBLICATIONS SECTION XXX
     --------------------------- -->
