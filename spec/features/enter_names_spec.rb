
feature "entering names" do
  scenario "user_enters_name" do
    visit "/"
    fill_in :first_player, with: "Alex"
    fill_in :second_player, with: "Ben"
    click_button "submit"
    expect(page).to have_text("Alex vs. Ben")
  end
end

# As Player 1,
# So I can see how close I am to winning
# I want to see Player 2's Hit Points

feature "Hit points" do
  scenario "displaying player 2" do
    sign_in_and_play
    expect(page).to have_content("Ben HP: 50")
  end


  # As Player 1,
  # So I can start to win a game of Battle,
  # I want my attack to reduce Player 2's HP by 10

  scenario "reduce player 2 HP by 10" do
    sign_in_and_play
    expect(page).to have_content("Ben HP: 50")
  end
end

# As Player 1,
# So I can win a game of Battle,
# I want to attack Player 2, and I want to get a confirmation

feature "Attack" do
  scenario "attacking player_2" do
    sign_in_and_play
    expect(page).to have_content("Alex attacks Ben")
  end
end

# As two Players,
# So we can continue our game of Battle,
# We want to switch turns

feature "Switch players" do
  scenario "change from player_1 to player_2" do
    sign_in_and_play
    find_button("Change turn").click
    expect(page).to have_content("It is now Ben's turn")
  end
end

# As Player 1,
# So I can see how close I am to losing,
# I want to see my own hit points

feature "viewing hitpoints" do
  scenario "as Player 1, I can view my hitpoints" do
    sign_in_and_play
    expect(page).to have_content('Alex HP: 60')
  end
end

# As Player 1,
# So I can lose a game of Battle,
# I want Player 2 to attack me, and I want to get a confirmation

feature "attacking" do
  scenario "with confirmation for Player 1" do
    sign_in_and_play
    find_button("Change turn").click
    click_button 'Attack'
    expect(page).to have_content 'Ben attacks Alex'
  end
end

# As Player 1,
# So I can start to lose a game of Battle,
# I want Player 2's attack to reduce my HP

feature "attacking" do
  scenario "As Player 1, I want attacks to reduce my hitpoints" do
    sign_in_and_play
    find_button("Change turn").click
    click_button 'Attack'
    expect(page).to have_content 'Alex HP: 50'
  end
end
