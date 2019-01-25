class WelcomeController < ApplicationController

  def homepage
	@business = Business.first
	@staff = User.all.where.not(role: 2)
  	@services = Service.all.order('name ASC')
  	@request = Request.new
  	@user = User.new
  end

end
