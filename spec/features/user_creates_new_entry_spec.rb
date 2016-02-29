require "rails_helper"

feature "User creates an entry" do
  scenario "successfully for today" do
    login_as( create(:user), :scope => :user, :run_callbacks => false)
    visit root_path

    expect(page).to have_content("Diary")
    click_on I18n.t("entries.index.today")
    fill_in Entry.human_attribute_name("content"), with: "good day"
    click_on I18n.t("entries.new.save")

    expect(page).to have_link(I18n.t("entries.show.index"))
    expect(page.current_path).to eq(entry_path(Entry.last))
    expect(page).to have_content("good day")
  end
  
  scenario "successfully for any date" do
    login_as( create(:user), :scope => :user, :run_callbacks => false)
    visit root_path

    expect(page).to have_content("Diary")
    click_on I18n.t("entries.index.any_date")
    fill_in Entry.human_attribute_name("content"), with: "good day"
    select '2011', from: "entry[target_date(1i)]"
    select 'February', from: "entry[target_date(2i)]"
    select '1', from: "entry[target_date(3i)]"
    select '12', from: "entry[target_date(4i)]"
    select '00', from: "entry[target_date(5i)]"
    click_on I18n.t("entries.new.save")

    expect(page).to have_link(I18n.t("entries.show.index"))
    expect(page.current_path).to eq(entry_path(Entry.last))
    expect(page).to have_content("good day")
  end

  scenario "unsuccessfully" do
    login_as( create(:user), :scope => :user, :run_callbacks => false)
    visit root_path

    expect(page).to have_content("Diary")

    click_on I18n.t("entries.index.any_date")
    click_on I18n.t("entries.new.save")

    expect(page).to have_content("can't be blank")
  end
end
