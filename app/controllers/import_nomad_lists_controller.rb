class ImportNomadListsController < AuthenticatedController
  def index
    @url = NomadlistImport.new(current_user.nomadlist_username)
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
