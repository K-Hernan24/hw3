class PlacesController < ApplicationController

  def index
  # find all places in db
    @places = Place.all
  # render places/index view
  end

  def show
    # find a place
      @place = Place.find_by({"id" => params["id"]})
    # find entries within a place
      @entries = Entry.where({"place_id" => @place["id"]})
    end
  
  def new
  # render view with new Place form
  end
  
  def create
    # start with a new place
    @place = Place.new

    # assign user-entered form data to Place's columns
    @place["name"] = params["name"]
    @place.save
    redirect_to "/places"
  end

  def destroy
    #find the specific place
    @place = Place.find_by({"id" => params["id"]})

    #destroy the place row in db
    @place.destroy

    #redirect the user back to places
    redirect_to "/places"
  end
end
