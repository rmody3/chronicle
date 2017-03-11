class SessionsController < ApplicationController


  def create
    byebug
    @account = Account.find_by(email: account_params[:email])
    if @account.authenticate(account_params[:password])
      session[:account_id] = @account.id
      redirect_to @account
    else
      render :new
    end
  end

  private
    def account_params
      params.require(:account).permit(:email, :password)
    end

end
