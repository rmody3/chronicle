class SessionsController < ApplicationController

  def new
    @account = Account.new
    @accounts = Acount.all
  end

  def create
    @account = Account.find_by(email: account_params[:email])

    if @account && @account.authenticate(account_params[:password])
      session[:account_id] = @account.id
      redirect_to account_path(@account)
    else
       flash.now[:danger] = 'Invalid email/password combination'
      redirect_to '/'
    end
  end

  def destroy
    byebug
    session[:account_id] = nil
    redirect_to '/'
  end

  private
    def account_params
      params.require(:account).permit(:email, :password)
    end
end
