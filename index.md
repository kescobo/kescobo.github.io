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
  title = "Research Scientist",
  company = "Wellesley College",
  location = "Massachusetts",
  from = "2018-01-01",
  to = "",
  active = true,
  descr = """
**Klepac-Ceraj Lab**

Research Topics:

* Human microbiome
* Child cognitive development
* Computational biology education
* Diversity in STEM
* Open source development
"""}

\experience{
  title = "Postdoctoral Fellow",
  company = "Harvard TH Chan School of Public Health",
  location = "Boston",
  from = "2017-05-30",
  to = "2018-12-31",
  descr = """
**Huttenhower Lab**

Research Topics:

* Human microbiome
* Inflammatory arthritis
* Computational biology education
"""}

\experience{
  title = "Postdoctoral Fellow",
  company = "University of California, San Diego",
  location = "San Diego",
  from = "2014-05-01",
  to = "2017-06-01",
  descr = """
**Dutton Lab**

Research Topics:

* Horizontal Gene Transfer
* Microbial communities
* Modeling interspecies interactions
"""}

\experience{
  title = "Curriculum Fellow",
  company = "Harvard Medical School",
  location = "Boston",
  from = "2014-05-01",
  to = "2017-06-01",
  last = true,
  descr = """
**Masters in Immunology**  
2014-2016

Responsibilities:

* Course design and instruction
* **Course**: Methods in Basic and Clinical Immunology
* **Course**: Understanding Immunology Research
* Masters Program administration
* Student Mentoring

**Harvard Medical School Online Learning**  
2016-2017

Responsibilities:

* Course design and instruction
* **Course**: HMX Fundamentals - Biochemistry
"""}

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
