class SessionsController < ApplicationController

  def new
    @account = Account.new
    @accounts = Acount.all
  end

  def create
    @account = Account.find_by(email: account_params[:email])
    if @account && @account.authenticate(account_params[:password])
      session[:account_id] = @account.id
      redirect_to @account, notice: "Welcome Back"
    else
      render index
    end
  end

  def destroy
    session[:account_id] = nil
    redirect_to root_url
  end

  private
    def account_params
      params.require(:account).permit(:email, :password)
    end
end
