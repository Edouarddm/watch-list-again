require 'json'
require 'open-uri'

Movie.destroy_all
puts 'DB CLEAN'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
url = 'https://tmdb.lewagon.com/movie/popular'
url_2 = 'https://tmdb.lewagon.com/movie/top_rated'
movies = JSON.parse(URI.open(url).read)['results']
movies.each do |movie|
  poster_url_path = 'https://image.tmdb.org/t/p/original'
  Movie.create(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: "#{poster_url_path}#{movie['poster_path']}",
    rating: movie['vote_average']
  )
end

movies = JSON.parse(URI.open(url_2).read)['results']
movies.each do |movie|
  poster_url_path = 'https://image.tmdb.org/t/p/original'
  Movie.create(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: "#{poster_url_path}#{movie['poster_path']}",
    rating: movie['vote_average']
  )
end

puts 'DB READY'
