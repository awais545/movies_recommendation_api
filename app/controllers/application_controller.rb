class ApplicationController < ActionController::Base
	protect_from_forgery

	def parse_json_request
		JSON.load(request.raw_post)
	rescue
		false
	end
end
