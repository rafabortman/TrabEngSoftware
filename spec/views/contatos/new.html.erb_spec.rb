require 'rails_helper'

RSpec.describe "contatos/new", type: :view do
  before(:each) do
    assign(:contato, Contato.new(
      :email => "MyString",
      :assunto => "MyString",
      :corpo => "MyText"
    ))
  end

  it "renders new contato form" do
    render

    assert_select "form[action=?][method=?]", contatos_path, "post" do

      assert_select "input[name=?]", "contato[email]"

      assert_select "input[name=?]", "contato[assunto]"

      assert_select "textarea[name=?]", "contato[corpo]"
    end
  end
end
