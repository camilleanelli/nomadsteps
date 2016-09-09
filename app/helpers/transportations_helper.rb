module TransportationsHelper

def title_upload
    if @transportation.tickets.empty?
      "Upload Invoice Tickets Boarding pass"
    else
      "Check your travel's documents "
    end
  end
end
