class WelcomeController < ApplicationController
  def homepage
  		@business = Business.first
  		@staff = User.artist.all
	  	@services = Service.all.order('name ASC')
	  	@request = Request.new
	  	@user = User.new
  end


   

end
