# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([
  { user_name: 'michaelrulez',
    password: 'password',
    email: 'michael@email.com' },

  { user_name: 'jordanyrulez',
    password: 'password',
    email: 'jordany@email.com' },

  { user_name: 'paulrulez',
    password: 'password',
    email: 'paul@email.com' },
    ])

Favorite.create([
  { user_id: 1,
    movie_id: 1},
  { user_id: 2,
    movie_id: 1},
  { user_id: 3,
    movie_id: 3} ])

Backlog.create([
  { user_id: 1,
    movie_id: 3},
  { user_id: 2,
    movie_id: 3},
  { user_id: 3,
    movie_id: 1} ])

Review.create([
  { user_id: 1,
    movie_id: 1,
    title: "best movie ever!!!!!!",
    body: "wow this movie is so gd good. its my favorite movie of all time. its like a great scavenger hunt through nyc. I highly recommend this movie to anyone who hasn't seen it. Seriously, it's the best movie. It's better than all the other die hards wow so good. So realistic.",
    rating: 9 },
  { user_id: 2,
    movie_id: 1,
    title: "second best movie ever!!!!!!",
    body: "wow this movie is so gd good. its my favorite movie of all time. its like a great scavenger hunt through nyc. I highly recommend this movie to anyone who hasn't seen it. Seriously, it's the best movie. It's better than all the other die hards wow so good. So realistic.",
    rating: 8 },
  { user_id: 2,
    movie_id: 2,
    title: "bad movie",
    body: "wow this movie is so gd bad. its my least favorite movie of all time. its like a horrible scavenger hunt through nyc. I highly disrecommend this movie to anyone who hasn't seen it. Seriously, it's the worst movie. It's better than all the other stardusts wow so bad. So unrealistic.",
    rating: 4 },
    ])

Comment.create([
  { user_id: 1,
    movie_id: 1,
    body: "this is the best movie ever whoever only rated it 8 is an idiot" },
  { user_id: 2,
    movie_id: 1,
    body: "nah this is the second best movie your a moron" }
    ])
