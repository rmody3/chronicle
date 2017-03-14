class ArticleChroniclesController < ApplicationController

  def create
    #need to save article to DB and create new article ID before proceeding w/ adding articles to chronicles
    @article_chronicle = ArticleChronicle.create(params)
  end


end
