class SubscriptionsController < ApplicationController

  def create
    Subscription.create(account_id: current_account.id, chronicle_id: params[:chronicle_id])
    redirect_to(:back)
  end
end
