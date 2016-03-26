require "rails_helper"

describe SettingsController do
  describe "#update" do
    it "updates subscription settings" do
      user = create(:user)

      sign_in user
      put :update, user: user, user: { subscribed: true}

      expect(assigns(:user).subscribed).to eq true
    end
  end
end
