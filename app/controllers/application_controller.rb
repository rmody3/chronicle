class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_account, :logged_in?

  def index
    @account = Account.new
    @chronicle_match = Chronicle.all.sort_by {|chron| chron.downvotes - chron.upvotes }
  end

  def not_found
    respond_to do |format|

      format.html { render template: 'static/404', layout: false, status: 404 }

    end
  end

  def require_login
      redirect_to '/' if !logged_in?
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
