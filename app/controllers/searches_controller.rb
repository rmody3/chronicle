class SearchesController < ApplicationController
	def index
		if params[:commit] == "Chronicles"
			@search = Search.create(search_terms: search_params[:search_terms])
			@chronicles = Chronicle.public
			@chronicle_display = []

			@chronicles.each do |chron|
    		chron.tags.each do |tag|
    			@chronicle_display << chron if @search.search_term == tag && !@chronicle_display.include?(chron)
  		 	end
		 	end
			render "searches/chronicles/index"

		elsif params[:commit] == "Articles"
			@search_term = search_params[:search_term]
			@search = GuardianAPI.new.query(search_params)
			render "searches/articles/index"
		else
			flash[:message] = "something went wrong"
		end
	end

	private
	def search_params
		params.require(:search).permit(:search_term, :page_size, :from_date, :to_date, :order_by)
	end

end
