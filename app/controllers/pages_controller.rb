class PagesController < ApplicationController
	 def letsencrypt
      # use your code here, not mine
      render text: ENV['LETSENCRYPT']
    end
end
