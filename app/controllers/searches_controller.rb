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
			@search_pagesize = article_params[:page_size]
			@search_term = article_params[:search_term]
			@search = GuardianAPI.new(search_term: article_params[:search_term], page_size: article_params[:page_size], from_date: article_params[:from_date], to_date: article_params[:to_date], order_by: article_params[:order_by], search_term: article_params[:search_term])
			@search_page_1 = @search.query(article_params)
			@search_page_2 = add_more_articles(@search)
			@search_page_3 = add_more_articles(@search)
			@search_page_4 = add_more_articles(@search)
			@search_page_5 = add_more_articles(@search)
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

	def add_more_articles(search_instance)
		search_instance.update_page
		search_instance.query(article_params)
	end


end
