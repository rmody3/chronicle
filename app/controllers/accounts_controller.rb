class AccountsController < ApplicationController

  before_action :require_login, only:[:show]

  def show
    @account = Account.find(params[:id])
    @chronicles = Chronicle.all
    @mychronicles = []
      @chronicles.map do |chron|
        @mychronicles << chron if chron.admin_id == current_account.id
      end
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      session[:account_id] = @account.id
      flash[:notice] = "Your account was created successfully"
      render "show"
    else
      flash[:notice] = "Not Valid. Please try again"
      render "new"
    end
  end

  private
    def account_params
      params.require(:account).permit(:name, :email, :password, :password_confirmation, :bio)
    end

end
