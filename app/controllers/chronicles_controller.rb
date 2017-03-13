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
    if @chronicle =! nil
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
      params.require(:chronicle).permit(:name, :description, :public,  :admin_id)
    end


end
