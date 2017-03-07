class ImportNomadListsController < AuthenticatedController
  def index
  #   @url = ImportJsonTrip.new(current_user.nomadlist_username)
  #   @trips = @url.nomadlist_table.each do |hash|
  #     current_user.trips.find_or_create_by(start_date: hash["date_start"],
  #                                          end_date: hash["date_end"],
  #                                          destination: hash["place"],
  #                                          image_trip: "https://nomadlist.com" + hash["place_photo"],
  #                                          longitude: hash["longitude"],
  #                                          latitude: hash["latitude"],
  #                                          person_number: 1,
  #                                          city_name: hash["place"],
  #                                          country_name: hash["country"]
  #                                          )
  #   end
  #   redirect_to trips_path
  # end


  @url = Nomadlist.new(current_user.nomadlist_username)
  @nomadlist_table = @url.table_import
  @nomadlist_table.each do |hash|
    current_user.trips.find_or_create_by(start_date: hash["start_date"],
                                          end_date: hash["end_date"],
                                          city_name: hash["city"],
                                          country_name: hash["country"],
                                          longitude: hash["longitude"],
                                          latitude: hash["latitude"]
                                          )
  end
  redirect_to trips_path
end

end
