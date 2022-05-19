# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'open-uri'
require 'json'

url = "https://tmdb.lewagon.com/movie/top_rated"
movies = URI.open(url).read
movies2 = JSON.parse(movies)


movies2["results"].each do |e|
  Movie.create(
    title: e["overview"],
    overview: e["title"],
    poster_url: "https://image.tmdb.org/t/p/w500#{e["backdrop_path"]}",
    rating: e["vote_average"],
  )
end
