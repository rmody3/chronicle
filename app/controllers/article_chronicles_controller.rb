class ArticleChroniclesController < ApplicationController

  def create
  	byebug
    #need to save article to DB and create new article ID before proceeding w/ adding articles to chronicles
    @article = Article.create(title: article_chronicle_params[:article_title], description: article_chronicle_params[:article_snippet], date: article_chronicle_params[:article_pub_date], url: article_chronicle_params[:article_url], pic_url: article_chronicle_params[:article_thumbnail])
    @article_chronicle = ArticleChronicle.create(article_id: @article.id, chronicle_id: article_chronicle_params[:chronicle_id] )
  end

  private

  def article_chronicle_params
  	params.require(:article_chronicle).permit(:chronicle_id, :article_title, :article_url, :article_snippet, :article_thumbnail, :article_pub_date)
  end


end
