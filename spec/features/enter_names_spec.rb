
feature "entering names" do
  scenario "user_enters_name" do
    visit "/"

    fill_in :first_player, with: "Alex"
    fill_in :second_player, with: "Zeeshan"
    click_button "submit"

    expect(page).to have_text("Alex vs. Zeeshan")

  end
end

# As Player 1,
# So I can see how close I am to winning
# I want to see Player 2's Hit Points

feature "Hit points" do
  scenario "displaying player 2" do
    visit "/"

    fill_in :first_player, with: "Alex"
    fill_in :second_player, with: "Zeeshan"
    click_button "submit"

    expect(page).to have_content("Zeeshan HP: 10")

  end
end
