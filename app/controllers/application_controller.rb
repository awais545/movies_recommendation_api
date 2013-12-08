class ApplicationController < ActionController::Base
	protect_from_forgery

	def parse_request_body
		JSON.load(request.raw_post)
	rescue
		false
	end

	def json_format_error
		render json: { message: 'Invalid JSON payload' }.to_json, status: 400
	end
end
