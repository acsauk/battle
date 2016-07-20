
feature "entering names" do
  scenario "user_enters_name" do
    visit "/"

    fill_in :first_player, with: "Alex"
    fill_in :second_player, with: "Zeeshan"
    click_button "submit"

    expect(page).to have_text("Alex vs. Zeeshan")

  end
end
