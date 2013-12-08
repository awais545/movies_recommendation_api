class ApplicationController < ActionController::Base
	protect_from_forgery

	http_basic_authenticate_with name: 'kurobase', password: 'kurobase_awais_api'

	def parse_json_request
		JSON.load(request.raw_post)
	rescue
		false
	end
end
