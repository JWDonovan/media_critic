# frozen_string_literal: true

user_list = [
  [
    'user@gmail.com',
    'password',
    false
  ],
  [
    'admin@gmail.com',
    'password',
    true
  ]
]

user_list.each do |email, password, admin|
  user = User.new(
    email: email,
    password: password,
    admin: admin
  )

  user.save
end

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

review_list = [
  [
    'Die Hard is my favorite movie',
    'Not sure if it\'s a Christmas movie though.',
    4.0,
    Movie.first.id,
    User.first.id
  ]
]

review_list.each do |title, content, rating, movie_id, user_id|
  review = Review.new(
    title: title,
    content: content,
    rating: rating,
    movie_id: movie_id,
    user_id: user_id
  )

  review.save
end