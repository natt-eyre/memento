require "rails_helper"

feature "User creates an entry with default date" do
  scenario "successfully" do
    login_as( create(:user), :scope => :user, :run_callbacks => false)
    visit root_path

    expect(page).to have_content("Diary")

    click_on I18n.t("entries.index.new")
    fill_in Entry.human_attribute_name("content"), with: "good day"
    click_on I18n.t("entries.new.save")

    expect(page).to have_link(I18n.t("entries.show.index"))
    expect(page.current_path).to eq(entry_path(Entry.last))
    expect(page).to have_content("good day")
  end

  scenario "unsuccessfully" do
    login_as( create(:user), :scope => :user, :run_callbacks => false)
    visit root_path

    expect(page).to have_content("Diary")

    click_on I18n.t("entries.index.new")
    click_on I18n.t("entries.new.save")

    expect(page).to have_content("can't be blank")
  end
end
