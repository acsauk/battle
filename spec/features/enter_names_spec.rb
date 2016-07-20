#require 'app'

RSpec.feature "entering names", :type => :feature do
  scenario "user_enters_name" do
    visit "/"

    fill_in "name", :with => "Prashant"
    click_button "submit"

    expect(page).to have_text("Name successfully created.")

  end
end
