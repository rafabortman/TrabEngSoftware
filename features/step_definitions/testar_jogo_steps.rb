Given("I have no jogos") do
  Jogo.delete_all
end

Given("I am on the list of {string}") do |pageName|
  visit '/'+pageName
end

Given("I have jogos titled {string}") do |string|
  string.split(',').each do |jogo|
    Jogo.create!(:titulo=>jogo,:imagem_url=>"https://yt3.ggpht.com/51PhqIUDv3rTv80bFhZk4UoVbpv4-7uI5OMBccn4TQkCFlfUpXO-gMhWi3abe8IM5laDjWsinrwmlc503w=w40-nd", :descricao=>"jogo de teste")
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