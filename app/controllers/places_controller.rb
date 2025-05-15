class PlacesController < ApplicationController

  def index
  # find all places in db
    @places = Place.all
  # render places/index view
  end

  def new
  # render view with new Place form
  end
  
  def show
  # find a place
    @place = Place.find_by({"id" => params["id"]})
  # find entries within a place
    @entries = Entry.where({"place_id" => @place["id"]})
  end


  def create
    # start with a new place
    @place = Place.new

    # assign user-entered form data to Place's columns
    @place["name"] = params["name"]
    @place.save
    redirect_to "/places"
  end

  def edit

  end

  def update

  end

  def destroy

  end
end
