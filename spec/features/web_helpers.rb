def sign_in_and_play
  visit "/"
  fill_in :first_player, with: "Alex"
  fill_in :second_player, with: "Ben"
  click_button "submit"
  click_button("Attack")
end

def defeat_enemy
  find_button("Change turn").click
  click_button("Attack")
end
