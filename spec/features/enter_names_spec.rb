
feature "entering names" do
  scenario "user_enters_name" do
    sign_in_and_play
    expect(page).to have_text("Alex vs. Ben")
  end
end

# As Player 1,
# So I can see how close I am to winning
# I want to see Player 2's Hit Points

feature "Hit points" do
  scenario "displaying player 2" do
    sign_in_and_play
    expect(page).to have_content("Ben HP: 60")
  end


  # As Player 1,
  # So I can start to win a game of Battle,
  # I want my attack to reduce Player 2's HP by 10

  scenario "reduce player 2 HP by 10" do
    sign_in_and_play
    click_link("Attack")
    expect(page).to have_content("Ben HP: 50")
  end
end

# As Player 1,
# So I can win a game of Battle,
# I want to attack Player 2, and I want to get a confirmation

feature "Attack" do
  scenario "attacking player_2" do
    sign_in_and_play
    click_link("Attack")
    expect(page).to have_content("Alex attacks Ben")
  end
end

# As two Players,
# So we can continue our game of Battle,
# We want to switch turns

feature "Switch players" do
  scenario "change from player_1 to player_2" do
    sign_in_and_play
    click_link("Attack")
    has_link?("Change turn")
    click_link("Change turn")
    expect(page).to have_content("It is now Ben's turn")
  end
end
