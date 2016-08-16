# supprime camilleanelli hardcodé, ça doit venir du user connecté
# boucler sur le tableau de hash de nomad trips, et créer des Trip (modele)
# ces trips doivent être associés au current users

# bonus
# changer l'action pour un create
# déclencher plusieurs fois l'action n'est pas censé créer plusieurs fois les même Trip
# création en tâche de fond
class ImportNomadListsController < ApplicationController
  def index
    @url = ImportTrip.new(current_user.nomadlist_username)
    @trips = @url.table_import.each do |hash|
      current_user.trips.find_or_create_by(start_date: hash["start_date"],
        end_date: hash["end_date"],
        destination: hash["city"],
        longitude: hash["longitude"],
        latitude: hash["latitude"])
    end
    redirect_to root_path
  end
end
