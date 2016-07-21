def sign_in_and_play
  visit "/"
  fill_in :first_player, with: "Alex"
  fill_in :second_player, with: "Ben"
  click_button "submit"
  click_button("Attack")
end
