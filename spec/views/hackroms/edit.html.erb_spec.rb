require 'rails_helper'
=begin
RSpec.describe "hackroms/edit", type: :view do
  before(:each) do
    @hackrom = assign(:hackrom, Hackrom.create!(
      :nomeRom => "MyString",
      :jogo => nil
    ))
  end

  it "renders the edit hackrom form" do
    render

    assert_select "form[action=?][method=?]", hackrom_path(@hackrom), "post" do

      assert_select "input[name=?]", "hackrom[nomeRom]"

      assert_select "input[name=?]", "hackrom[jogo_id]"
    end
  end
end
=end
