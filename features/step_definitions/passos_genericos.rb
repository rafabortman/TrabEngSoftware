Given("estou na pagina inicial") do
  visit '/home'
end

When("eu clico no link {string}") do |clickableLink|
  click_link (clickableLink)
end

When("preencho {string} com {string}") do |campo, valor|
  fill_in campo, with: valor
end

When("clico no botao {string}") do |button|
  click_button (button)
end

Then("eu devo ser redirecionado para a pagina {string}") do |textValue|
  expect(page.current_url).to have_content(textValue) 
end

Then("devo ver {string}") do |valor|
	expect(page).to have_content(valor)
end

Then("nao devo ver {string}") do |valor|
	expect(page).to have_no_content(valor)
end

When("I am in the page of {string}") do |page|
  visit '/'+page
end
