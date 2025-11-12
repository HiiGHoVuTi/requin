#import "@preview/jogs:0.2.3": *

#let code = ```
function toRepublicanCalendar(year, month, day) {
  const months = [
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
  ];

  function isLeapYear(year) {
    return (
      year % 4 === 0 &&
      (year % 100 !== 0 || year % 400 === 0) &&
      year % 4000 !== 0
    );
  }

  function toRepublicanCalendar(year, month, day) {
    let startYear = year;
    if (month < 9 || (month === 9 && day < 22)) {
      startYear--;
    }

    const startRepublican = new Date(startYear, 8, 22);
    const currentDate = new Date(year, month - 1, day);
    let dayOfYear = Math.floor(
      (currentDate - startRepublican) / (24 * 60 * 60 * 1000)
    );

    const daysInYear = isLeapYear(startYear) ? 366 : 365;
    if (dayOfYear >= daysInYear - 5) {
      const sansculottidesDay = dayOfYear - (daysInYear - 6);
      return {
        day: sansculottidesDay,
        month: "Sansculottides",
        year: startYear - 1791,
      };
    }

    if (isLeapYear(startYear)) {
      if (dayOfYear >= 365) {
        return {
          day: dayOfYear - 364,
          month: "Sansculottides",
          year: startYear - 1791,
        };
      }
      dayOfYear++;
    } else {
      if (dayOfYear >= 364) {
        return {
          day: dayOfYear - 363,
          month: "Sansculottides",
          year: startYear - 1791,
        };
      }
    }

    const republicanMonth = Math.floor(dayOfYear / 30);
    const republicanDay = (dayOfYear % 30) + 1;
    return {
      day: republicanDay,
      month: months[republicanMonth],
      year: startYear - 1791,
    };
  }
  return toRepublicanCalendar(year, month, day);
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

#let today = datetime.today();
#let todayDate = call-js-function(bytecode, "format", today.year(), today.month(), today.day())
#let romanise(x) = call-js-function(bytecode, "romanise", x)