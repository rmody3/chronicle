class GuardianAPI
	include HTTParty

	attr_accessor :current_page, :page_size, :to_date, :from_date, :search_term, :request_hash

	class Endpoints
		BASE_URL = "https://content.guardianapis.com"
		SEARCH_URL = "#{BASE_URL}/search?"
		API_PARTIAL_URL = "api-key=#{ENV['GUARDIAN_API_KEY']}"
	end

	def query(params)
		create_search_format(params)
		request = HTTParty.get(Endpoints::SEARCH_URL+@search_format+Endpoints::API_PARTIAL_URL).to_json
		@request_hash = JSON.parse(request)
	end

	def create_search_format(params)
		@search_format = "show-fields=trailText&"
		params.each do |key, value|
			if !value.blank? && key != "search_term"
				@search_format += "#{key.gsub("_", "-")}=#{value}&"
			elsif key == "search_term"
				search_input_formatted(value)
			end

		end
		@search_format += "q=#{@search_term_formatted}&"
	end

	def current_page_format
		"page=#{@current_page}&"
	end

	def update_page
		# go to next page of articles
		@current_page += 1
		# will have to reload query with current search
	end

	def search_input_formatted(user_search_term)
		@search_term_formatted = user_search_term.gsub(" ", "%20").gsub("&", "%26").gsub('"', "%22").gsub("@", "%40").gsub("#", "%23").gsub("$", "%24").gsub("%", "%25").gsub("^", "%5").gsub("=", "%3D").gsub("?", "%3F")
	end

end

