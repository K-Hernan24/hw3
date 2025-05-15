class EntriesController < ApplicationController

  def show
  # Render entry details about a place
    @entry = Entry.find({"id" => params["id"]})
    @place = Place.find_by("id" => @entry["place_id"])
  end
  
  def new

  end

  def create
  # Create a new entry
    @entry = Entry.new

  # Assign user-entered form data to Entry table in DB
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["occurred_on"] = params["occurred_on"]
    @entry["place_id"] = params["place_id"]
    @entry.save
    redirect_to "/places/#{@entry["place_id"]}"
  end

end
