require 'rails_helper'

RSpec.describe "contatos/show", type: :view do
  before(:each) do
    @contato = assign(:contato, Contato.create!(
      :email => "Email",
      :assunto => "Assunto",
      :corpo => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Assunto/)
    expect(rendered).to match(/MyText/)
  end
end
