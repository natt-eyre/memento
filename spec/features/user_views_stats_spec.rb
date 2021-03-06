require "rails_helper"

feature "User views stats" do
  scenario "with an entry" do
    user = create(:user)
    entry = create(:entry, user: user, content: "g")

    login_as( user, :scope => :user, :run_callbacks => false)
    visit root_path
    click_on I18n.t("stats.show")

    expect(page).to have_link(I18n.t("entries.show.index"))
    expect(page.current_path).to eq(stats_path)
    expect(page).to have_content("1entry")
    expect(page).to have_content("1word")
    expect(page).to have_content("1character")
    expect(page).to have_content("g (1)")
    expect(page).to have_content("1day")
  end

  scenario "without entries" do
    login_as( create(:user), :scope => :user, :run_callbacks => false)
    visit root_path
    click_on I18n.t("stats.show")

    expect(page).to have_link(I18n.t("entries.show.index"))
    expect(page.current_path).to eq(stats_path)
    expect(page).to have_content("0")
  end
end
