class ChroniclesController < ApplicationController
  protect_from_forgery with: :exception

  def index
  end

  def new
    @chronicle = Chronicle.new
  end

  def create
    @chronicle = Chronicle.create(chronicle_params)
    @chronicle.admin_id = current_account.id
    @chronicle.save
    if @chronicle
      Subscription.create(account_id: current_account.id, chronicle_id: @chronicle.id)
      if !params[:chronicle][:tags].blank?
        params[:chronicle][:tags].each do |tag|
          @tag = Tag.find_or_create_by(name: tag.downcase)
          @chronicle.tags << @tag
        end
      end
      redirect_to account_path(current_account)
    else
      render 'new'
    end
  end

  def show
    @chronicle = Chronicle.find(params[:id])
    @comment = Comment.new
  end

  private
    def chronicle_params
      params.require(:chronicle).permit(:name, :description, :private,  :admin_id)
    end


end
