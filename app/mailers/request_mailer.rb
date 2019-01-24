class RequestMailer < ApplicationMailer
	def status_email(request)
		@request = request
       mail(to: @request.email, subject: "Pleasant Dreams Co. Inquiry") 
   end
end
