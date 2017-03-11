class ChroniclesController < ApplicationController
  protect_from_forgery with: :exception

  def index
  end

  def new
    @chronicle = Chronicle.new
  end

  def create
    @chronicle = Chronicle.new(chronicle_params)
    if @chronicle.save
      redirect_to account_path(current_account)
    else
      render 'new'
    end
  end

end
