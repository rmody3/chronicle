class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_account

  def index
    @account = Account.new
  end

  def require_login  
      redirect_to '/' if current_account.blank?
    #so that we can just use a before_action and then it will check before any page and redirect to login scree if not ready

  end

  def current_account
    @current_account ||= Account.find(session[:account_id])
  end

  def require_logged_in
    redirect_to controller:'sessions', action:'new' unless current_account
  end
end
