require 'json'
require 'net/http'

class ImportJsonTrip
  def initialize(username)
    @json = Net::HTTP.get(URI('https://nomadlist.com/' + username + '.json'))
    @trip_hash = JSON.parse(@json)
  end

  def nomadlist_table
    @trip_hash['trips']
  end
end
