require "rails_helper"

feature "User updates subscription to daily reminders" do
  scenario "turning on daily reminders" do
    user = create(:user)
    login_as( user, :scope => :user, :run_callbacks => false)
    visit root_path

    click_on I18n.t("settings.edit")
    check('Subscribe for daily reminders')
    click_on I18n.t("settings.save")

    expect(page.current_path).to eq(root_path)
    expect(page).to have_content("Settings saved!")
  end
end
