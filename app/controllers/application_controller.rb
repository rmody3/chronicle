class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_account

  def index
    @account = Account.new
  end

  def logged_in?
    !!session[:account_id]

    #Rahul: I think we should change this to:
    # def require_login
    #   redirect_to '/' if current_account.blank?
    # end
    #so that we can just use a before_action and then it will check before any page and redirect to login scree if not ready

  end

  def current_account
    @current_account ||= Account.find(session[:account_id]) if logged_in?
  end
end
