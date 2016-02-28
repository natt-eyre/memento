require "rails_helper"

feature "User creates an entry" do
  scenario "successfully" do
    user = create(:user)
    entry = create(:entry, user: user)
    login_as( user, :scope => :user, :run_callbacks => false)

    visit entry_path(entry)
    click_on I18n.t("entries.show.edit")
    fill_in Entry.human_attribute_name("content"), with: "bad day"
    click_on I18n.t("entries.edit.save")

    expect(page.current_path).to eq(entry_path(Entry.last))
    expect(page).to have_content("bad day")
  end
end
