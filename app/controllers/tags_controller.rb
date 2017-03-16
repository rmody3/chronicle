class TagsController < ApplicationController

  def create
    params[chronicle[tags]].each do |tag|
      @tag = Tag.create(name: tag)
      ChronicleTag.create(chronicle_id: parms[:chronicle_id], tag_id: @tag.id)
    end
    redirect_to(:back)
  end

  def destroy
  	@chronicle_tag = ChronicleTag.find_by(chronicle_id: params[:chronicle_id], tag_id: params[:id])
  	@chronicle_tag.destroy
    redirect_to (:back)
  end
end
