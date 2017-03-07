require 'open-uri'
require 'nokogiri'

class Nomadlist 
	def initialize(username)
		@document = Nokogiri::HTML(open("https://nomadlist.com/" + username))
	end

	def fetch_city(number)
    	@document.css('tr.trip')[number].css('td.name h2 a').text
  	end

  	def fetch_country(number)
  		@document.css('tr.trip')[number].css('td.country a').text
  	end

  	def table_import
    	table = []
    	@document.css('tr.trip').each_with_index do |tr, index|
      	trip_hash = {}
		trip_hash['start_date'] = tr.attributes['data-date-start'].value
		trip_hash['end_date'] = tr.attributes['data-date-end'].value
		trip_hash['city'] = fetch_city(index)
		trip_hash['country'] = fetch_country(index)
		trip_hash['latitude'] = tr.attributes['data-latitude'].value
		trip_hash['longitude'] = tr.attributes['data-longitude'].value
		table.push(trip_hash)
    end
    table
  end
end