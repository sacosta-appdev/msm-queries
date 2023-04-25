class ActorsController < ApplicationController

  def actor_list

    @actors = Actor.all

    render({ :template => "actors_template/actor_list.html.erb"})

  end


  def actor_details

    @actor_id = params.fetch("id")
    @actor = Actor.all.where({ :id => @actor_id })[0]

    @filmography = Character.all.where({ :actor_id => @actor_id })

    render({ :template => "actors_template/actor_details.html.erb"})

  end

end
