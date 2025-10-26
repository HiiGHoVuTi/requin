#let toRepublicanCalendar(year, month, day) = {
  let months = (
    "Vendémiaire",
    "Brumaire",
    "Frimaire",
    "Nivôse",
    "Pluviôse",
    "Ventôse",
    "Germinal",
    "Floreal",
    "Prairial",
    "Messidor",
    "Thermidor",
    "Fructidor",
    "Sansculottides",
  )
  let isLeapYear = year => {
    let mod = calc.rem
    return (
      mod(year, 4) == 0
        and (mod(year, 100) != 0 or mod(year, 400) == 0)
        and mod(year, 4000) != 0
    )
  }

  let startYear = if month < 9 or (month == 9 and day < 22) { year - 1 } else {
    year
  }
  let dayOfYear = int((
    datetime(year: year, month: month, day: day)
      - datetime(year: startYear, month: 9, day: 22)
  ).days())
  let isLeapStartYear = isLeapYear(startYear)
  let daysInYear = if isLeapStartYear { 366 } else { 365 }

  if dayOfYear >= daysInYear - 5 {
    let sansculottidesDay = dayOfYear - (daysInYear - 6)
    return (
      day: sansculottidesDay,
      month: "Sansculottides",
      year: startYear - 1791,
    )
  }

  if isLeapStartYear {
    if dayOfYear >= 365 {
      return (
        day: dayOfYear - 364,
        month: "Sansculottides",
        year: startYear - 1791,
      )
    }
    dayOfYear += 1
  } else if dayOfYear >= 364 {
    return (
      day: dayOfYear - 363,
      month: "Sansculottides",
      year: startYear - 1791,
    )
  }

  let republicanMonth = calc.quo(dayOfYear, 30)
  let republicanDay = calc.rem(dayOfYear, 30) + 1
  return (
    day: republicanDay,
    month: months.at(republicanMonth),
    year: startYear - 1791,
  )
}

#let formatToRepublicanDate(y, m, d) = {
  let d = toRepublicanCalendar(y, m, d)
  return "version du " + str(d.day) + " " + str(d.month) + ", an " + str(d.year)
}

#let romanise(num) = {
  let roman-map = (
    (1000, "M"),
    (900, "CM"),
    (500, "D"),
    (400, "CD"),
    (100, "C"),
    (90, "XC"),
    (50, "L"),
    (40, "XL"),
    (10, "X"),
    (9, "IX"),
    (5, "V"),
    (4, "IV"),
    (1, "I"),
  )
  let result = ""
  let remainder = num
  for (value, symbol) in roman-map {
    while remainder >= value {
      result += symbol
      remainder -= value
    }
  }
  result
}

#let pset(class: "6.100",
  title: "PSET 0",
  author: "Juliette",
  date: datetime.today(),
  subproblems: "I.1.a.i",
  collaborators: (),
  doc
) = {[
#let dateRev = formatToRepublicanDate(date.year(), date.month(), date.day())

/* Convert collaborators to a string if necessary */
#let collaborators=if type(collaborators) == array {collaborators.join(", ")} else {collaborators}

/* Problem + subproblem headings */
#set heading(numbering: (..nums) => {
    nums = nums.pos()
    let roman = romanise(nums.at(0))
    if nums.len() == 1 {
      [ Chapitre #roman.
      ]
    } else if nums.len() == 2 {
      [Problème #roman.#nums.at(1):]
    } 
    else {
      numbering(subproblems, ..(..nums).slice(2))
    }
})

/* Set metadata */
#set document(
  title: [#class - #title],
  author: author,
  date: date,
)

/* Set up page numbering and continued page headers */
#set page(
  numbering: "1",
  header: context {
    
  let elems = query(selector(heading.where(level: 1)).before(here()),)
  let chapter = if elems.len() == 0 { [Sommaire] } else  {elems.last().body }

  if counter(page).get().first() > 1 [
    #set text(style: "italic", size: 12pt)
    #title -- #chapter
    #h(1fr)
    #author
    // #h(1fr)
    // #if collaborators != none {[w/ #collaborators]}
    #block(line(length: 100%, stroke: 0.5pt), above: 0.6em)
  ]
}, 
footer: context {
  set text(size: 12pt)
  block(line(length: 100%, stroke: 0.5pt), above: 0.6em)
  "Page "; counter(page).display("1/1", both: true)
  h(1fr)
  set text(style: "italic")
  dateRev
})

/* Add numbering and some color to code blocks */
#show raw.where(block: true): it => {
  block[
    #h(1fr)
    #box(
      width: 100%-0.5em,
      radius: 0.3em,
      stroke: luma(50%),
      inset: 1em,
      fill: luma(98%)
    )[
      #show raw.line: l => {
        box(width:measure([#it.lines.last().count]).width, align(right, text(fill: luma(50%))[#l.number]))
        h(0.5em)
        l.body
      }
      #it
    ]
  ]
}

/* Make the title */
#align(center, {
  text(size: 1.6em, weight: "bold")[#title \ ]
  text(size: 1.2em, weight: "semibold")[#author \ ]
  emph[
    // #date.display("[year]-[month]-[day]") 
    #dateRev
    #if collaborators != none {[
      \ Collaborators: #collaborators
    ]}
  ]
  box(line(length: 100%, stroke: 1pt))
})

#doc
]}
