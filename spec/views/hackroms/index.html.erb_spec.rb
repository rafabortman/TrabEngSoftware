require 'rails_helper'

RSpec.describe "hackroms/index", type: :view do
  before(:each) do
    assign(:hackroms, [
      Hackrom.create!(
        :nomeRom => "Nome Rom",
        :jogo => nil
      ),
      Hackrom.create!(
        :nomeRom => "Nome Rom",
        :jogo => nil
      )
    ])
  end

  it "renders a list of hackroms" do
    render
    assert_select "tr>td", :text => "Nome Rom".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
