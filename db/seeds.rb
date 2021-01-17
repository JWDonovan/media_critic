movie_list = [
  [
    'Die Hard',
    'An NYPD officer tries to save his wife and several others taken hostage by German terrorists during a Christmas party at the Nakatomi Plaza in Los Angeles.',
    1988,
    'die_hard.jpg'
  ],
  [
    'Superbad',
    'Two co-dependent high school seniors are forced to deal with separation anxiety after their plan to stage a booze-soaked party goes awry.',
    2007,
    'superbad.jpg'
  ],
  [
    'The Incredibles',
    'A family of undercover superheroes, while trying to live the quiet suburban life, are forced into action to save the world.',
    2004,
    'the_incredibles.jpg'
  ],
  [
    'There Will Be Blood',
    'A story of family, religion, hatred, oil and madness, focusing on a turn-of-the-century prospector in the early days of the business.',
    2007,
    'there_will_be_blood.jpg'
  ],
  [
    'Truman Show',
    'An insurance salesman discovers his whole life is actually a reality TV show.',
    1998,
    'truman_show.jpg'
  ]
]

movie_list.each do |title, synopsis, release_year, filename|
  movie = Movie.new(
    title: title,
    synopsis: synopsis,
    release_year: release_year
  )

  movie.poster.attach(io: File.open("app/assets/images/#{filename}"), filename: filename, content_type: 'image/jpeg')
  movie.save
end