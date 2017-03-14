class SearchesController < ApplicationController

	def index
		@article_chronicle = ArticleChronicle.new
		if params[:commit] == "Chronicles"
			@search_term = chronicle_params[:search_term]
			# search chronicles to do a wild card match
			## currently search term must match tag exactly for tags since tags are one word
			@chronicle_match = Chronicle.search(@search_term)
			render "searches/chronicles/index"

		elsif params[:commit] == "Articles"
			@search_term = article_params[:search_term]
			@search = GuardianAPI.new.query(article_params)
			render "searches/articles/index"
		else
			flash[:message] = "something went wrong"
		end
	end

	private
	def article_params
		params.require(:search).permit(:search_term, :page_size, :from_date, :to_date, :order_by)
	end

	def chronicle_params
		params.require(:search).permit(:search_term)
	end


end
