class MoviesController < ApplicationController

  def movie_list
    
    @list_of_movies = Movie.all

    render({ :template => "movies_template/movie_list.html.erb"})

  end


  def movie_details
    
    @movie_id = params.fetch("id")
    @movie = Movie.all.where({ :id => @movie_id })[0]
    director_id = @movie.director_id

    @director = Director.all.where({ :id => director_id })[0]

    render({ :template => "movies_template/movie_details.html.erb"})

  end

end
