class TagsController < ApplicationController

  def create
    byebug
    params[chronicle[tags]].each do |tag|
      @tag = Tag.create(name: tag)
      ChronicleTag.create(chronicle_id: parms[:chronicle_id], tag_id: @tag.id)
    end
    redirect_to(:back)
  end
end
