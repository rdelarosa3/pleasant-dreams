class WelcomeController < ApplicationController
  def homepage
  		@staff = User.artist.all
	  	# @service_types = ServiceType.all.order('name ASC')
	  	@request = Request.new
	  	@user = User.new
  end
end
