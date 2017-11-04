require 'rails_helper'

RSpec.describe "contatos/edit", type: :view do
  before(:each) do
    @contato = assign(:contato, Contato.create!(
      :email => "MyString",
      :assunto => "MyString",
      :corpo => "MyText"
    ))
  end

  it "renders the edit contato form" do
    render

    assert_select "form[action=?][method=?]", contato_path(@contato), "post" do

      assert_select "input[name=?]", "contato[email]"

      assert_select "input[name=?]", "contato[assunto]"

      assert_select "textarea[name=?]", "contato[corpo]"
    end
  end
end
