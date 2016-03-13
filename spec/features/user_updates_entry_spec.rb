require "rails_helper"

feature "User creates an entry" do
  scenario "successfully", js: true do
    user = create(:user)
    entry = create(:entry, user: user)
    login_as( user, :scope => :user, :run_callbacks => false)

    visit entry_path(entry)
    click_on I18n.t("entries.show.edit")
    el = find(:xpath, "//div[@contenteditable='true']")
    el.set("bad day")
    click_on I18n.t("entries.edit.save")

    expect(page.current_path).to eq(entry_path(Entry.last))
    expect(page).to have_content("bad day")
  end
end
