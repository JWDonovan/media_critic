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
    'New York City policeman John McClane (Bruce Willis) is visiting his estranged wife (Bonnie Bedelia) and two daughters on Christmas Eve. He joins her at a holiday party in the headquarters of the Japanese-owned business she works for. But the festivities are interrupted by a group of terrorists who take over the exclusive high-rise, and everyone in it. Very soon McClane realizes that there\'s no one to save the hostages -- but him.',
    1988,
    'die_hard.jpg'
  ],
  [
    'Superbad',
    'High-school seniors Seth (Jonah Hill) and Evan (Michael Cera) have high hopes for a graduation party: The co-dependent teens plan to score booze and babes so they can become part of the in-crowd, but separation anxiety and two bored police officers (Bill Hader, Seth Rogen) complicate the pair\'s self-proclaimed mission.',
    2007,
    'superbad.jpg'
  ],
  [
    'The Incredibles',
    'In this lauded Pixar animated film, married superheroes Mr. Incredible (Craig T. Nelson) and Elastigirl (Holly Hunter) are forced to assume mundane lives as Bob and Helen Parr after all super-powered activities have been banned by the government. While Mr. Incredible loves his wife and kids, he longs to return to a life of adventure, and he gets a chance when summoned to an island to battle an out-of-control robot. Soon, Mr. Incredible is in trouble, and it\'s up to his family to save him.',
    2004,
    'the_incredibles.jpg'
  ],
  [
    'There Will Be Blood',
    'Silver miner Daniel Plainview (Daniel Day-Lewis) leads a hardscrabble life with his son, H.W. (Dillon Freasier). When he hears about oil oozing from the ground near the Western town of Little Boston, Daniel takes his son on a mission to find their fortune. Daniel makes his lucky strike and becomes a self-made tycoon but, as his fortune grows, he deviates into moral bankruptcy.',
    2007,
    'there_will_be_blood.jpg'
  ],
  [
    'Truman Show',
    'He doesn\'t know it, but everything in Truman Burbank\'s (Jim Carrey) life is part of a massive TV set. Executive producer Christof (Ed Harris) orchestrates "The Truman Show," a live broadcast of Truman\'s every move captured by hidden cameras. Cristof tries to control Truman\'s mind, even removing his true love, Sylvia (Natascha McElhone), from the show and replacing her with Meryl (Laura Linney). As Truman gradually discovers the truth, however, he must decide whether to act on it.',
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
    'It\'s a glorious scene-stealer for Alan Rickman, though it\'s a credit to Willis\'s cheeky charisma that his scene is not in fact stolen.',
    4.0,
    Movie.last.id,
    User.first.id
  ],
  [
    'Die Hard still feels as fresh and thrilling as the first time it screened.',
    'The picture is extremely violent: bombs go off, bullets rip through flesh, heads are slammed against steel. But Die Hard is also smart, satirical-and, in an odd way, heartwarming.',
    5.0,
    Movie.last.id,
    User.last.id
  ],
  [
    'My favorite role of Jim Carrey\'s career',
    'One of the smartest, most inventive movies in memory, it manages to be as endearing as it is provocative.',
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
