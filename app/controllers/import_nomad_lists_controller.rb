class ImportNomadListsController < ApplicationController
  def index
      @url = ImportJsonTrip.new(current_user.nomadlist_username)
      @trips = @url.nomadlist_table.each do |hash|
        current_user.trips.find_or_create_by(start_date: hash["date_start"],
                                             end_date: hash["date_end"],
                                             destination: hash["place"],
                                             image_trip: "https://nomadlist.com" + hash["place_photo"],
                                             country: hash["country"],
                                             longitude: hash["longitude"],
                                             latitude: hash["latitude"]
                                             )
      end
      redirect_to root_path
  end
end
