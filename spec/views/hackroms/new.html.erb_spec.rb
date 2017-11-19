require 'rails_helper'

RSpec.describe "hackroms/new", type: :view do
  before(:each) do
    assign(:hackrom, Hackrom.new(
      :nomeRom => "MyString",
      :jogo => nil
    ))
  end

  /#it "renders new hackrom form" do
    render

    assert_select "form[action=?][method=?]", hackroms_path, "post" do

      assert_select "input[name=?]", "hackrom[nomeRom]"

      assert_select "input[name=?]", "hackrom[jogo_id]"
    end
  end#/
end
