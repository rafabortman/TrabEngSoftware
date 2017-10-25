Given("I have no jogos") do
  Jogo.delete_all
end

Given("I am on the list of {string}") do |pageName|
  visit '/'+pageName
end

Given("i have jogos titled {string}") do |string|
  string.split(',').each do |jogo|
    Jogo.create!(:titulo=>jogo,:imagem_url=>"https://pbs.twimg.com/profile_images/874026752250478592/A-Bs-WB8.jpg", :descricao=>"jogo de teste")
  end
end

When("I click the link {string}") do |clickableLink|
  click_link (clickableLink)
end

When("I fill in {string} with {string}") do |fieldName, fieldValue|
  fill_in fieldName, with: fieldValue
end

When("I click the button {string}") do |button|
  click_button (button)
end

Then("I should see {string}") do |textValue|
  expect(page).to have_content (textValue)
end