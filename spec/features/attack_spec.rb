feature "Attack Player" do
  scenario "player attacks another" do
    sign_in_and_play
    click_button "attack"
    expect(page).to have_content('Attacked Noby')
  end
end
