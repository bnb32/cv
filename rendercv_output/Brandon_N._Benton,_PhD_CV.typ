
#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "Brandon N. Benton, PhD"
#let locale-catalog-page-numbering-style = context { "Brandon N. Benton, PhD - Page " + str(here().page()) + " of " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-updated-date-style = "Last updated in Feb 2025"
#let locale-catalog-language = "en"
#let design-page-size = "us-letter"
#let design-section-titles-font-size = 1.4em
#let design-colors-text = rgb(0, 0, 0)
#let design-colors-section-titles = rgb(0, 0, 0)
#let design-colors-last-updated-date-and-page-numbering = rgb(128, 128, 128)
#let design-colors-name = rgb(0, 0, 0)
#let design-colors-connections = rgb(0, 0, 0)
#let design-colors-links = rgb(0, 79, 144)
#let design-section-titles-font-family = "New Computer Modern"
#let design-section-titles-bold = true
#let design-section-titles-line-thickness = 0.5pt
#let design-section-titles-font-size = 1.4em
#let design-section-titles-type = "with-parial-line"
#let design-section-titles-vertical-space-above = 0.5cm
#let design-section-titles-vertical-space-below = 0.3cm
#let design-section-titles-small-caps = false
#let design-links-use-external-link-icon = false
#let design-text-font-size = 10pt
#let design-text-leading = 0.6em
#let design-text-font-family = "New Computer Modern"
#let design-text-alignment = "justified"
#let design-text-date-and-location-column-alignment = right
#let design-header-photo-width = 3.5cm
#let design-header-use-icons-for-connections = true
#let design-header-name-font-family = "New Computer Modern"
#let design-header-name-font-size = 30pt
#let design-header-name-bold = true
#let design-header-connections-font-family = "New Computer Modern"
#let design-header-vertical-space-between-name-and-connections = 0.7cm
#let design-header-vertical-space-between-connections-and-first-section = 0.7cm
#let design-header-use-icons-for-connections = true
#let design-header-horizontal-space-between-connections = 0.5cm
#let design-header-separator-between-connections = ""
#let design-header-alignment = center
#let design-highlights-summary-left-margin = 0cm
#let design-highlights-bullet = "◦"
#let design-highlights-top-margin = 0.25cm
#let design-highlights-left-margin = 0.4cm
#let design-highlights-vertical-space-between-highlights = 0.25cm
#let design-highlights-horizontal-space-between-bullet-and-highlights = 0.5em
#let design-entries-vertical-space-between-entries = 1.2em
#let design-entries-date-and-location-width = 4.15cm
#let design-entries-allow-page-break-in-entries = true
#let design-entries-horizontal-space-between-columns = 0.1cm
#let design-entries-left-and-right-margin = 0.2cm
#let design-page-top-margin = 2cm
#let design-page-bottom-margin = 2cm
#let design-page-left-margin = 2cm
#let design-page-right-margin = 2cm
#let design-page-show-last-updated-date = true
#let design-page-show-page-numbering = true
#let design-links-underline = true
#let design-entry-types-education-entry-degree-column-width = 1cm
#let date = datetime.today()

// Metadata:
#set document(author: name, title: name + "'s CV", date: date)

// Page settings:
#set page(
  margin: (
    top: design-page-top-margin,
    bottom: design-page-bottom-margin,
    left: design-page-left-margin,
    right: design-page-right-margin,
  ),
  paper: design-page-size,
  footer: if design-page-show-page-numbering {
    text(
      fill: design-colors-last-updated-date-and-page-numbering,
      align(center, [_#locale-catalog-page-numbering-style _]),
      size: 0.9em,
    )
  } else {
    none
  },
  footer-descent: 0% - 0.3em + design-page-bottom-margin / 2,
)
// Text settings:
#let justify
#let hyphenate
#if design-text-alignment == "justified" {
  justify = true
  hyphenate = true
} else if design-text-alignment == "left" {
  justify = false
  hyphenate = false
} else if design-text-alignment == "justified-with-no-hyphenation" {
  justify = true
  hyphenate = false
}
#set text(
  font: design-text-font-family,
  size: design-text-font-size,
  lang: locale-catalog-language,
  hyphenate: hyphenate,
  fill: design-colors-text,
  // Disable ligatures for better ATS compatibility:
  ligatures: true,
)
#set par(
  spacing: 0pt,
  leading: design-text-leading,
  justify: justify,
)
#set enum(
  spacing: design-entries-vertical-space-between-entries,
)

// Highlights settings:
#let highlights(..content) = {
  list(
    ..content,
    marker: design-highlights-bullet,
    spacing: design-highlights-vertical-space-between-highlights,
    indent: design-highlights-left-margin,
    body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
  )
}
#show list: set list(
  marker: design-highlights-bullet,
  spacing: 0pt,
  indent: 0pt,
  body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
)

// Entry utilities:
#let three-col(
  left-column-width: 1fr,
  middle-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (auto, auto, auto),
) = [
  #block(
    grid(
      columns: (left-column-width, middle-column-width, right-column-width),
      column-gutter: design-entries-horizontal-space-between-columns,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #middle-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

#let two-col(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, auto),
  column-gutter: design-entries-horizontal-space-between-columns,
) = [
  #block(
    grid(
      columns: (left-column-width, right-column-width),
      column-gutter: column-gutter,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

// Main heading settings:
#let header-font-weight
#if design-header-name-bold {
  header-font-weight = 700
} else {
  header-font-weight = 400
}
#show heading.where(level: 1): it => [
  #set par(spacing: 0pt)
  #set align(design-header-alignment)
  #set text(
    font: design-header-name-font-family,
    weight: header-font-weight,
    size: design-header-name-font-size,
    fill: design-colors-name,
  )
  #it.body
  // Vertical space after the name
  #v(design-header-vertical-space-between-name-and-connections)
]

#let section-title-font-weight
#if design-section-titles-bold {
  section-title-font-weight = 700
} else {
  section-title-font-weight = 400
}

#show heading.where(level: 2): it => [
  #set align(left)
  #set text(size: (1em / 1.2)) // reset
  #set text(
    font: design-section-titles-font-family,
    size: (design-section-titles-font-size),
    weight: section-title-font-weight,
    fill: design-colors-section-titles,
  )
  #let section-title = (
    if design-section-titles-small-caps [
      #smallcaps(it.body)
    ] else [
      #it.body
    ]
  )
  // Vertical space above the section title
  #v(design-section-titles-vertical-space-above, weak: true)
  #block(
    breakable: false,
    width: 100%,
    [
      #if design-section-titles-type == "moderncv" [
        #two-col(
          alignments: (right, left),
          left-column-width: design-entries-date-and-location-width,
          right-column-width: 1fr,
          left-content: [
            #align(horizon, box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles))
          ],
          right-content: [
            #section-title
          ]
        )

      ] else [
        #box(
          [
            #section-title
            #if design-section-titles-type == "with-parial-line" [
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ] else if design-section-titles-type == "with-full-line" [

              #v(design-text-font-size * 0.4)
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ]
          ]
        )
      ]
     ] + v(1em),
  )
  #v(-1em)
  // Vertical space after the section title
  #v(design-section-titles-vertical-space-below - 0.5em)
]

// Links:
#let original-link = link
#let link(url, body) = {
  body = [#if design-links-underline [#underline(body)] else [#body]]
  body = [#if design-links-use-external-link-icon [#body#h(design-text-font-size/4)#box(
        fa-icon("external-link", size: 0.7em),
        baseline: -10%,
      )] else [#body]]
  body = [#set text(fill: design-colors-links);#body]
  original-link(url, body)
}

// Last updated date text:
#if design-page-show-last-updated-date {
  let dx
  if design-section-titles-type == "moderncv" {
    dx = 0cm
  } else {
    dx = -design-entries-left-and-right-margin
  }
  place(
    top + right,
    dy: -design-page-top-margin / 2,
    dx: dx,
    text(
      [_#locale-catalog-last-updated-date-style _],
      fill: design-colors-last-updated-date-and-page-numbering,
      size: 0.9em,
    ),
  )
}

#let connections(connections-list) = context {
  set text(fill: design-colors-connections, font: design-header-connections-font-family)
  set par(leading: design-text-leading*1.7, justify: false)
  let list-of-connections = ()
  let separator = (
    h(design-header-horizontal-space-between-connections / 2, weak: true)
      + design-header-separator-between-connections
      + h(design-header-horizontal-space-between-connections / 2, weak: true)
  )
  let starting-index = 0
  while (starting-index < connections-list.len()) {
    let left-sum-right-margin
    if type(page.margin) == "dictionary" {
      left-sum-right-margin = page.margin.left + page.margin.right
    } else {
      left-sum-right-margin = page.margin * 4
    }

    let ending-index = starting-index + 1
    while (
      measure(connections-list.slice(starting-index, ending-index).join(separator)).width
        < page.width - left-sum-right-margin
    ) {
      ending-index = ending-index + 1
      if ending-index > connections-list.len() {
        break
      }
    }
    if ending-index > connections-list.len() {
      ending-index = connections-list.len()
    }
    list-of-connections.push(connections-list.slice(starting-index, ending-index).join(separator))
    starting-index = ending-index
  }
  align(list-of-connections.join(linebreak()), design-header-alignment)
  v(design-header-vertical-space-between-connections-and-first-section - design-section-titles-vertical-space-above)
}

#let three-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (left, auto, right),
) = (
  if design-section-titles-type == "moderncv" [
    #three-col(
      left-column-width: right-column-width,
      middle-column-width: left-column-width,
      right-column-width: 1fr,
      left-content: right-content,
      middle-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      right-content: middle-content,
      alignments: (design-text-date-and-location-column-alignment, left, auto),
    )
  ] else [
    #block(
      [
        #three-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          middle-content: middle-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let two-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, design-text-date-and-location-column-alignment),
  column-gutter: design-entries-horizontal-space-between-columns,
) = (
  if design-section-titles-type == "moderncv" [
    #two-col(
      left-column-width: right-column-width,
      right-column-width: left-column-width,
      left-content: right-content,
      right-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      alignments: (design-text-date-and-location-column-alignment, auto),
    )
  ] else [
    #block(
      [
        #two-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let one-col-entry(content: "") = [
  #let left-space = design-entries-left-and-right-margin
  #if design-section-titles-type == "moderncv" [
    #(left-space = left-space + design-entries-date-and-location-width + design-entries-horizontal-space-between-columns)
  ]
  #block(
    [#set par(spacing: design-text-leading); #content],
    breakable: design-entries-allow-page-break-in-entries,
    inset: (
      left: left-space,
      right: design-entries-left-and-right-margin,
    ),
    width: 100%,
  )
]

= Brandon N. Benton, PhD

// Print connections:
#let connections-list = (
  [#fa-icon("location-dot", size: 0.9em) #h(0.05cm)Seattle, WA, 98106],
  [#box(original-link("mailto:brandon.benton@nrel.gov")[#fa-icon("envelope", size: 0.9em) #h(0.05cm)brandon.benton\@nrel.gov])],
  [#box(original-link("https://bnb32.github.io/")[#fa-icon("link", size: 0.9em) #h(0.05cm)bnb32.github.io])],
  [#box(original-link("https://linkedin.com/in/brandonnbenton")[#fa-icon("linkedin", size: 0.9em) #h(0.05cm)brandonnbenton])],
  [#box(original-link("https://github.com/bnb32")[#fa-icon("github", size: 0.9em) #h(0.05cm)bnb32])],
)
#connections(connections-list)



== Summary


#one-col-entry(
  content: [Senior Software\/Data Engineer at the National Renewable Energy Lab with a record of achievement in data science, machine learning, and scientific computing. Multiple publications and presentations relating to generative machine learning, renewable resource modeling, and earth system modeling. Additional experience instructing physics and mathematics classes for undergraduates and overseeing graduate student research programs.]
)


== Education


// YES DATE, NO DEGREE
#two-col-entry(
  left-content: [
    #strong[Cornell University]

#emph[PhD in Physics]
  ],
  right-content: [
    #emph[Ithaca, NY]

#emph[Jan 2016 – Jan 2019]
  ],
)
#block(
  [
    #set par(spacing: 0pt)
    
  ],
  inset: (
    left: design-entries-left-and-right-margin,
    right: design-entries-left-and-right-margin,
  ),
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, NO DEGREE
#two-col-entry(
  left-content: [
    #strong[Cornell University]

#emph[MS in Physics]
  ],
  right-content: [
    #emph[Ithaca, NY]

#emph[Jan 2012 – Jan 2016]
  ],
)
#block(
  [
    #set par(spacing: 0pt)
    
  ],
  inset: (
    left: design-entries-left-and-right-margin,
    right: design-entries-left-and-right-margin,
  ),
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, NO DEGREE
#two-col-entry(
  left-content: [
    #strong[Georgia Southern University]

#emph[BS in Physics]
  ],
  right-content: [
    #emph[Statesboro, GA]

#emph[Jan 2008 – Jan 2012]
  ],
)
#block(
  [
    #set par(spacing: 0pt)
    
  ],
  inset: (
    left: design-entries-left-and-right-margin,
    right: design-entries-left-and-right-margin,
  ),
)



== Experience


#two-col-entry(
  left-content: [
    #strong[Senior Software\/Data Engineer]

#emph[National Renewable Energy Lab]
  ],
  right-content: [
    #emph[Golden, CO]

#emph[Jan 2022 – present]
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Lead developer on National Solar Radiation Database project \(NSRDB\).],[Streamlined NSRDB pipeline enabling 5x faster yearly reprocessing runs.],[Generalized NSRDB application scope and extended database beyond 60N latitude cap to full polar region.],[Added temperature-dependent snowy albedo model to improve accuracy of surface radiation predictions.],[Developed cloud property prediction and radiative transport models.],[Lead developer on Super Resolution for Renewable Energy Resource Data \(SUP3R\)],[Developed novel GAN-based downscaling methods, for SUP3R project, increasing speed of downscaling 300x over dynamical approaches.],[Led applications of this method to generate high-resolution wind resource data over Ukraine, Southeast Asia, and South America.],[Publicly released sup3r framework, consisting of comprehensive suite for feature engineering, data handling, model prototyping, training, and inference.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Post-Doctoral Fellow]

#emph[Cornell University]
  ],
  right-content: [
    #emph[Ithaca, NY]

#emph[Jan 2020 – Jan 2022]
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Designed and carried out research in areas of computer vision, climatology, weather patterns, and COVID modelling.],[Developed tools for detecting hurricane conditions in satellite images using computer vision techniques.],[Developed AWS interface to allow general public to perform climate simulations.],[Developed and planned hyperlocal weather forecasting system designed to improve winter-storm emergency response and enhance natural disaster coordination for New York state's rural communities.],[Led team of four undergraduate students using this code to perform on-demand weather forecasting for Tompkins County.],[Led research on effect of heat anomalies injected into aquaplanet SSTs and surface fields on polar vortex.],[Built custom compartmental infectious disease model including asymptomatic, symptomatic, hospitalization, and death projections for entire United States.],[Updated and improved complex database of tree ring information from variety of disparate, obscure, and hard-to-access data sources.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Data Scientist]

#emph[Independent Researcher]
  ],
  right-content: [
    #emph[Ithaca, NY]

#emph[Jan 2012 – Jan 2021]
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Designed and built working quadcopter with GPS-enabled navigation, remote control capability, and computer control interfaces.],[Developed Twitch bot to filter offensive content in channels, achieving 98\% success rate and currently in use on Twitch channel.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Graduate Teaching Assistant]

#emph[Cornell University]
  ],
  right-content: [
    #emph[Ithaca, NY]

#emph[Jan 2012 – Jan 2019]
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Instructed classes in Climate & Energy, Computer Graphics, Numerical Analysis, and Fundamentals of Physics.],[Prepared examinations and classroom materials.],[Led class projects and lab sessions.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[PhD Researcher]

#emph[Cornell University]
  ],
  right-content: [
    #emph[Ithaca, NY]

#emph[Jan 2013 – Jan 2019]
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Designed and carried out research in areas of fluid dynamics, condensed matter, and climate science.],[Developed and implemented numerical models to simulate complex physical systems.],[Analyzed large datasets using statistical and machine learning techniques.],[Published findings in peer-reviewed journals and presented at international conferences.],)
  ],
)



== Skills


#one-col-entry(
  content: [#strong[High Performance Computing:] Well versed in distributed systems, job scheduling, and parallel optimization]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Physics:] Excellent understanding of atmospheric and climate physics]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Programming:] Proficient in Python, Bash, MATLAB, Mathematica, C++, Fortran]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Machine Learning:] Well versed in TensorFlow, Keras, Scikit-Learn]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Mathematics:] Excellent understanding of differential equations, statistics, finite difference methods, calculus, and linear algebra]
)


== Publications


#two-col-entry(
  left-content: [
    #strong[The influence of cloud cover on the reliability of satellite-based solar resource data]

  ],
  right-content: [
    Feb 2025
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);Yu Xie, Manajit Sengupta, Jaemo Yang, Aron Habte, Grant Buster, Brandon Benton, Michael Foster, Andrew Heidinger, Yangang Liu

#v(design-highlights-top-margin - design-text-leading)Renewable and Sustainable Energy Reviews])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Potential effects of climate change and solar radiation modification on renewable energy resources]

  ],
  right-content: [
    Jan 2025
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);Andrew Kumler, Ben Kravitz, Caroline Draxl, Laura Vimmerstedt, Brandon Benton, Julie K Lundquist, Michael Martin, Holly Jean Buck, Hailong Wang, Christopher Lennard, Ling Tao

#v(design-highlights-top-margin - design-text-leading)Renewable and Sustainable Energy Reviews])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Tackling extreme urban heat: a machine learning approach to assess the impacts of climate change and the efficacy of climate adaptation strategies in urban microclimates]

  ],
  right-content: [
    Nov 2024
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);Grant Buster, Jordan Cox, Brandon N. Benton, Ryan King

#v(design-highlights-top-margin - design-text-leading)arXiv preprint arXiv:2411.05952])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Integration of a Physics-Based Direct Normal Irradiance \(DNI\) Model to Enhance the National Solar Radiation Database \(NSRDB\)]

  ],
  right-content: [
    Dec 2023
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Yu Xie, Manajit Sengupta, Jaemo Yang, Grant Buster, Brandon Benton, Aron Habte, Yangang Liu

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.1016/j.solener.2023.112195")[doi.org/10.1016/j.solener.2023.112195] (Solar Energy)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Super-resolution for Renewable Energy Resource Data with Wind from Reanalysis Data \(Sup3rWind\) and Application to Ukraine]

  ],
  right-content: [
    July 2024
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);Brandon N. Benton, Grant Buster, Pavlo Pinchuk, Andrew Glaws, Ryan N. King, Galen Maclaurin, Ilya Chernyakhovskiy

#v(design-highlights-top-margin - design-text-leading)arXiv preprint arXiv:2407.19086. Wind Energy \(Under Review\)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[High-Resolution Meteorology with Climate Change Impacts from Global Climate Model Data Using Generative Machine Learning]

  ],
  right-content: [
    April 2024
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Grant Buster, Brandon N. Benton, Andrew Glaws, Ryan King

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.1038/s41560-024-01507-9")[doi.org/10.1038/s41560-024-01507-9] (Nature Energy)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Intrinsic Century-Scale Variability in Tropical Pacific SSTs and Their Influence on Western US Hydroclimate]

  ],
  right-content: [
    Dec 2022
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);Colin P Evans, Sloan Coats, Carlos M Carrillo, Xiaolu Li, Marc J Alessi, Dimitris A Herrera, Brandon N Benton, Toby R Ault

#v(design-highlights-top-margin - design-text-leading)Geophysical Research Letters])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Minor Impacts of Major Volcanic Eruptions on Hurricanes in Dynamically-Downscaled Last Millennium Simulations]

  ],
  right-content: [
    Sept 2022
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);Brandon N Benton, Marc J Alessi, Dimitris A Herrera, Xiaolu Li, Carlos M Carrillo, Toby R Ault

#v(design-highlights-top-margin - design-text-leading)Climate Dynamics])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Approximate Mean-Field Equations of Motion for Quasi-2D Bose-Einstein Condensate Systems]

  ],
  right-content: [
    Nov 2012
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);Mark Edwards, Michael Krygier, Hadayat Seddiqi, Brandon Benton, Charles W Clark

#v(design-highlights-top-margin - design-text-leading)Physical Review E])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Prototyping Method for Bragg-Type Atom Interferometers]

  ],
  right-content: [
    Oct 2011
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);Brandon Benton, Michael Krygier, Jeffrey Heward, Mark Edwards, Charles W Clark

#v(design-highlights-top-margin - design-text-leading)Physical Review A])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Momentum-Space Engineering of Gaseous Bose-Einstein Condensates]

  ],
  right-content: [
    March 2011
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);Mark Edwards, Brandon Benton, Jeffrey Heward, Charles W Clark

#v(design-highlights-top-margin - design-text-leading)Physical Review A])



