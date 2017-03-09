class PagesController < ApplicationController
	skip_before_action :authenticate_user!
	
	def letsencrypt
    render text: ENV['LETSENCRYPT']
  end
end
