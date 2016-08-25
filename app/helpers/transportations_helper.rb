module TransportationsHelper

def title_upload
    if @transportation.tickets.empty?
      "Télécharger vos billets"
    else
      "Vos billets"
    end
  end
end
