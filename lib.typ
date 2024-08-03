#let show_correct = false

#let q_count = counter("questions")

#let setup_ex() = {
  q_count.update(0)
}

#let levels_emojis = (
  "emojis/chick.svg",
  "emojis/cat.svg",
  "emojis/octopus.svg",
  "emojis/shark.svg",
  "emojis/dragon.svg",
  "emojis/biohazard.svg",
).map(x => box(image(x)))


#let question(score, question) = {

  [ #levels_emojis.at(score) *Question #q_count.display()* #h(10pt) #question #h(1fr) /*#array.range(5).map(i => if i < score {$star.filled$} else {$star.stroked$}).sum()*/ \ ]

  q_count.step()
}

// et pour afficher la correction
#let correct(body) = {
  if (show_correct) {
    set text(white)
    rect(
      fill: rgb(196,255,181),
      inset: 8pt,
      radius: 4pt,
      width: 100%,
      [
        #set text(white)
        #rect(
          fill: green,
          inset: 8pt,
          radius: 4pt,
          width: 100%,
          [Correction],
        )
        #set text(black)
        #body
      ],
    )
  } else {}
}



