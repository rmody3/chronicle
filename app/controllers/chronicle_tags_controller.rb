class ChronicleTagsController < ApplicationController
  protect_from_forgery with: :exception

  def destroy
  	@tag = Tag.find(params[:tag_id])
  	@tag.destroy
  end
end