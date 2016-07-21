
feature "entering names" do
  scenario "user_enters_name" do
    visit "/"
    fill_in :first_player, with: "Alex"
    fill_in :second_player, with: "Ben"
    click_button "submit"
    expect(page).to have_text("Alex vs. Ben")
  end
end

feature "Hit points" do
  # As Player 1,
  # So I can see how close I am to losing,
  # I want to see my own hit points

  scenario "display Player 1" do
    sign_in_and_play
    expect(page).to have_content('Alex HP: 60')
  end

  # As Player 1,
  # So I can see how close I am to winning
  # I want to see Player 2's Hit Points

  scenario "display Player 2" do
    sign_in_and_play
    expect(page).to have_content("Ben HP: 50")
  end

  # As Player 1,
  # So I can start to lose a game of Battle,
  # I want Player 2's attack to reduce my HP

  scenario "reduces player 1 HP by 10" do
    sign_in_and_play
    find_button("Change turn").click
    click_button 'Attack'
    expect(page).to have_content 'Alex HP: 50'
  end

  # As Player 1,
  # So I can start to win a game of Battle,
  # I want my attack to reduce Player 2's HP by 10

  scenario "reduce player 2 HP by 10" do
    sign_in_and_play
    expect(page).to have_content("Ben HP: 50")
  end

  # As a Player,
  # So I can Lose a game of Battle,
  # I want to see a 'Lose' message if I reach 0HP first

  scenario "player 2 HP reaches 0" do
    sign_in_and_play
    10.times{ defeat_enemy }
    expect(page).to have_content("Ben loses the game :(")
  end
end

feature "Attack" do

  # As Player 1,
  # So I can win a game of Battle,
  # I want to attack Player 2, and I want to get a confirmation

  scenario "with confirmation for Player 1" do
    sign_in_and_play
    find_button("Change turn").click
    click_button 'Attack'
    expect(page).to have_content 'Ben attacks Alex'
  end

  scenario "with confirmation for Player 2" do
    sign_in_and_play
    expect(page).to have_content("Alex attacks Ben")
  end
end

feature "Switch players" do
  # As two Players,
  # So we can continue our game of Battle,
  # We want to switch turns

  scenario "change from player_1 to player_2" do
    sign_in_and_play
    find_button("Change turn").click
    expect(page).to have_content("It is now Ben's turn")
  end
end

feature "Game Over" do
  scenario "display game over page when game is over" do
    sign_in_and_play
    10.times{ defeat_enemy }
    expect(current_path).to eq "/game_over"
  end
end
