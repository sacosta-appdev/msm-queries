Rails.application.routes.draw do
  get("/", { :controller => "application", :action => "homepage" })

  get("/directors", { :controller => "directors", :action => "index" }) # make one controller for every DB table
  get("/directors/eldest", { :controller => "directors", :action => "eldest_director" })
  get("/directors/youngest", { :controller => "directors", :action => "youngest_director" })
  get("/directors/:id", { :controller => "directors", :action => "director_details" })

  get("/movies", { :controller => "movies", :action => "movie_list"})
  get("/movies/:id", { :controller => "movies", :action => "movie_details"})

  get("/actors", { :controller => "actors", :action => "actor_list"})
  get("/actors/:id", { :controller => "actors", :action => "actor_details"})

end
