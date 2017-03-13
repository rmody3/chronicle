class AccountsController < ApplicationController

  def show
    @account = Account.find(params[:id])
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      log_in @account
      flash[:notice] = "Your account was created successfully"
      render "show"
    else
      flash[:notice] = "Not Valid. Please try again"
      render "new"
    end

  end

  private
    def account_params
      params.require(:account).permit(:name, :email, :password, :bio)
    end

end
