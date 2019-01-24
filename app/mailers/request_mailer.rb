class RequestMailer < ApplicationMailer
	def status_email(request)
		@request = request
       mail(to: @request.email, subject: "Pleasant Dreams Co. Inquiry") 
   end

   def new_request(request, users)
   		@request = request
   		@users = users
   		@users.each do |user|
   			mail(to: user.email), subject: "Pleasant Dreams Co. NEW Inquiry"
   		end
   end
end
