require "rails_helper"

feature "User creates an entry" do
  scenario "successfully for today", js: true do
    login_as( create(:user), :scope => :user, :run_callbacks => false)
    visit root_path

    click_on I18n.t("entries.index.today")
    el = find(:xpath, "//div[@contenteditable='true']")
    el.set("good day")
    click_on I18n.t("entries.new.save")

    expect(page).to have_link(I18n.t("entries.show.index"))
    expect(page.current_path).to eq(entry_path(Entry.last))
    expect(page).to have_content("good day")
  end

  scenario "successfully for any date", js: true do
    login_as( create(:user), :scope => :user, :run_callbacks => false)
    visit root_path

    click_on I18n.t("entries.index.any_date")
    el = find(:xpath, "//div[@contenteditable='true']")
    el.set("good day")
    fill_in "entry_target_date", with: "2016-03-13"
    click_on I18n.t("entries.new.save")

    expect(page).to have_link(I18n.t("entries.show.index"))
    expect(page.current_path).to eq(entry_path(Entry.last))
    expect(page).to have_content("good day")
  end

  scenario "successfully with image", js: true do
    path = File.expand_path('../fixtures/test_image.png', File.dirname(__FILE__))
    login_as( create(:user), :scope => :user, :run_callbacks => false)
    visit root_path

    click_on I18n.t("entries.index.today")
    el = find(:xpath, "//div[@contenteditable='true']")
    el.set("good day")
    attach_file('entry_picture', path)
    click_on I18n.t("entries.new.save")

    expect(page).to have_css("img[src*='test_image.png']")
  end

  scenario "unsuccessfully" do
    login_as( create(:user), :scope => :user, :run_callbacks => false)
    visit root_path

    click_on I18n.t("entries.index.any_date")
    click_on I18n.t("entries.new.save")

    expect(page).to have_content("can't be blank")
  end
end
