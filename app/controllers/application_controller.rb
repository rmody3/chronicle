class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    @account = Account.new
  end

  def logged_in?
    !!session[:account_id]
  end

  def current_account
    @current_account ||= Account.find(session[:account_id]) if logged_in?
  end
end
