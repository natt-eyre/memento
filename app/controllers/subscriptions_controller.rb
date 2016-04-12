class SubscriptionsController < ApplicationController
  def unsubscribe
    if user = User.read_access_token(params[:signature])
      user.update_attribute :subscribed, false
      render text: "You have been unsubscribed"
    else
      render text: "Invalid Link"
    end
  end
end