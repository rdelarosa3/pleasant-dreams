module RequestsHelper
	def pending_requests
		Request.all.where(reviewed: false).count
	end
end