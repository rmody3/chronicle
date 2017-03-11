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
      flash[:notice] = "Your account was created successfully"
    else
      flash[:notice] = "Not Valid. Please try again"
    end
    redirect_to chronicles_path
  end

  private
    def account_params
      params.require(:account).permit(:name, :email, :password, :bio)
    end

end
