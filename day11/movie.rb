class Movie
  def initialize
    @title
    @director
    @genre
    @rating
  end

  def set_movie_data(tittle, director, genre, rating)
    @title = tittle
    @director = director
    @genre = genre
    @rating = rating
  end

  def display_movie()
    puts "%-25s %-25s %-20s %-10s" % [@title, @director, @genre, @rating]
    puts "\n"
  end
end
n=2
movies = []
# loop use to initilize the movie object
while n != 0
  movie = Movie.new()
  puts "enter the movie name = "
  movie_name = gets.chomp
  puts "enter the movie director = "
  movie_dir = gets.chomp
  puts "enter the movie genre = "
  movie_genre = gets.chomp
  puts "enter the movie rating = "
  movie_rating = gets.chomp.to_s
  movie.set_movie_data(movie_name, movie_dir, movie_genre, movie_rating)
  n = n-1
  movies << movie
end

# formated output
puts "%-25s %-25s %-20s %-10s" % ["Tittle","Director","Genre","Rating"]
puts "\n"
movies.each do|f|
  f.display_movie
end
