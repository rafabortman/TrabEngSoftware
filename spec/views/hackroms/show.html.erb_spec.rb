require 'rails_helper'
=begin
RSpec.describe "hackroms/show", type: :view do
  before(:each) do
    @hackrom = assign(:hackrom, Hackrom.create!(
      :nomeRom => "Nome Rom",
      :jogo => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome Rom/)
    expect(rendered).to match(//)
  end
end
=end
