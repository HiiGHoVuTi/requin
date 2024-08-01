
#import "@preview/jogs:0.2.3": *

#let code = ```
const months = [
    'Vendémiaire', 'Brumaire', 'Frimaire', 'Nivôse', 'Pluviôse', 'Ventôse',
    'Messidor', 'Thermidor', 'Fructidor', 'Prairial', 'Germinal', 'Floreal'
];

const sansculottides = ['Virtue', 'Genius', 'Labour', 'Opinion', 'Rewards', 'Revolution'];

function isLeapYear(year) {
    return (year % 4 === 0 && (year % 100 !== 0 || year % 400 === 0)) && (year % 4000 !== 0);
}

function toRepublicanCalendar(year, month, day) {
    let startYear = year;
    if (month < 9 || (month === 9 && day < 22)) {
        startYear--;
    }

    const startRepublican = new Date(startYear, 8, 22);
    const currentDate = new Date(year, month - 1, day);
    let dayOfYear = Math.floor((currentDate - startRepublican) / (24 * 60 * 60 * 1000));

    const daysInYear = isLeapYear(startYear) ? 366 : 365;
    if (dayOfYear >= daysInYear - 5) {
        const sansculottidesDay = dayOfYear - (daysInYear - 6);
        return { day: sansculottidesDay, month: 'Sansculottides', year: startYear - 1791 };
    }

    if (isLeapYear(startYear)) {
        dayOfYear++;
    }

    const republicanMonth = Math.floor(dayOfYear / 30);
    const republicanDay = dayOfYear % 30 + 1;
    return { day: republicanDay, month: months[republicanMonth], year: startYear - 1791 };
}

function format(y, m, d){
  const {year, month, day} = toRepublicanCalendar(y, m, d);
  return `version du ${day} ${month}, an ${year}`;
}

function romanise (num) {
    if (isNaN(num))
        return NaN;
    var digits = String(+num).split(""),
        key = ["","C","CC","CCC","CD","D","DC","DCC","DCCC","CM",
               "","X","XX","XXX","XL","L","LX","LXX","LXXX","XC",
               "","I","II","III","IV","V","VI","VII","VIII","IX"],
        roman = "",
        i = 3;
    while (i--)
        roman = (key[+digits.pop() + (i * 10)] || "") + roman;
    return Array(+digits.join("") + 1).join("M") + roman;
}
```

#let bytecode = compile-js(code)

#let pset(class: "6.100",
  title: "PSET 0",
  author: "Juliette",
  date: datetime.today(),
  subproblems: "I.1.a.i",
  collaborators: (),
  doc
) = {[


#let dateRev = call-js-function(bytecode, "format", date.year(), date.month(), date.day())

/* Convert collaborators to a string if necessary */
#let collaborators=if type(collaborators) == array {collaborators.join(", ")} else {collaborators}

/* Problem + subproblem headings */
#set heading(numbering: (..nums) => {
    nums = nums.pos()
    let roman = call-js-function(bytecode, "romanise", nums.at(0))
    if nums.len() == 1 {
      [ Chapitre #roman.
      ]
    } else if nums.len() == 2 {
      [Problème #roman.#nums.at(1):]
    } 
    else {
      numbering(subproblems, ..nums)
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
  if counter(page).get().first() > 1 [
    #set text(style: "italic", size: 12pt)
    #title -- CODA METS LE CHAPITRE ACTUEL
    #h(1fr)
    #author
    // #h(1fr)
    // #if collaborators != none {[w/ #collaborators]}
    #block(line(length: 100%, stroke: 0.5pt), above: 0.6em)
  ]
}, 
footer: context {
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
