require "rails_helper"

feature "User destroys the entry" do
  scenario "successfully", js: true do
    user = create(:user)
    entry = create(:entry, user: user, content: "bad day")
    login_as( user, :scope => :user, :run_callbacks => false)

    visit entry_path(entry)
    accept_confirm do
      click_on I18n.t("entries.show.destroy")
    end

    expect(page.current_path).to eq(entries_path)
    expect(page).not_to have_content(entry.created_at)
  end
end
