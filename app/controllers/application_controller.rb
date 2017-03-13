class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_account, :logged_in?

  def index
    @account = Account.new
  end

  def require_login
      redirect_to '/' if !logged_in?

    #so that we can just use a before_action and then it will check before any page and redirect to login scree if not ready

  end

  def current_account
    @current_account ||= Account.find(session[:account_id]) if session[:account_id]
  end

  def logged_in?
    !current_account.nil?
  end

  #
  # def self.sweep(time = 1.hour)
  #   if time.is_a?(String)
  #     time = time.split.inject { |count, unit| count.to_i.send(unit) }
  #   end
  #
  #     delete_all "updated_at < '#{time.ago.to_s(:db)}'"
  # end

end
