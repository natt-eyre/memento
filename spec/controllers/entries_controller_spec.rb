require "rails_helper"

describe EntriesController do
  describe "#create" do
    it "creates entries for current user" do
      user = create(:user)
      sign_in user
      post :create, entry: { content: "good day", target_date: Time.now}

      expect(Entry.last.user).to eq user
    end
  end

  describe "#show" do
    it "shows requested entry" do
      user = create(:user)
      entry = create(:entry, user: user, content: 'good day')

      sign_in user
      get :show, id: entry.id

      expect(assigns(:entry).content).to eq "good day"
    end
  end

  describe "#index" do
    it "shows a list of entries of current user" do
      our_user = create(:user)
      other_user = create(:user)

      entry1 = create(:entry, user: our_user)
      entry2 = create(:entry, user: other_user)

      sign_in our_user
      get :index

      expect(assigns(:entries).map(&:user)).to eq [our_user]
    end
  end

  describe "#update" do
    it "updates entry" do
      user = create(:user)
      entry = create(:entry, user: user)

      sign_in user
      put :update, id: entry.id, entry: { content: "updated_content"}

      expect(assigns(:entry).content).to eq "updated_content"
    end
  end

  describe "#destroy" do
    it "deletes entry" do
      user = create(:user)
      entry = create(:entry, user: user)

      sign_in user
      expect { delete :destroy, id: entry.id }.to change {
       user.entries.count }.by(-1)
    end
  end
end
