class TagsController < ApplicationController

  def create
    @tag = Tag.create(name: params[:tag_name])
    ChronicleTag.create(chronicle_id: , tag_id: @tag.id)
    #redirect_to(:back)
  end
end
