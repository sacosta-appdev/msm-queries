class DirectorsController < ApplicationController

  def index

    @list_of_directors = Director.all

    render ({ :template => "directors_template/index.html.erb" })

  end

  def eldest_director

    @eldest_name = Director.all.where.not({ :dob => nil }).order({ :dob => :asc})[0].name
    @eldest_id = Director.all.where.not({ :dob => nil }).order({ :dob => :asc})[0].id
    @eldest_dob = Director.all.where.not({ :dob => nil }).order({ :dob => :asc})[0].dob.strftime("%b %d, %Y")

    render ({ :template => "directors_template/eldest.html.erb" })

  end

  def youngest_director

    @youngest_name = Director.all.where.not({ :dob => nil }).order({ :dob => :desc})[0].name
    @youngest_id = Director.all.where.not({ :dob => nil }).order({ :dob => :desc})[0].id
    @youngest_dob = Director.all.where.not({ :dob => nil }).order({ :dob => :desc})[0].dob.strftime("%b %d, %Y")

    render ({ :template => "directors_template/youngest.html.erb" })

  end

  def director_details

    @director_id = params.fetch("id")
    @director_name = Director.where({ :id => @director_id })[0].name
    @director_dob = Director.where({ :id => @director_id })[0].dob
    @director_bio = Director.where({ :id => @director_id })[0].bio
    @director_img = Director.where({ :id => @director_id })[0].image
    @director_created = Director.where({ :id => @director_id })[0].created_at
    @director_updated = Director.where({ :id => @director_id })[0].updated_at


    nbr_of_seconds_created = Time.now - @director_created
    nbr_of_years_created = nbr_of_seconds_created / 60 / 60 / 24 / 365.25
    @nbr_of_years_created = nbr_of_years_created.round

    nbr_of_seconds_updated = Time.now - @director_updated
    nbr_of_years_updated = nbr_of_seconds_updated / 60 / 60 / 24 / 365.25
    @nbr_of_years_updated = nbr_of_years_updated.round

    @films = Movie.where({ :director_id => @director_id })
 
    render ({ :template => "directors_template/director_deets.html.erb"})
  
  end


end
