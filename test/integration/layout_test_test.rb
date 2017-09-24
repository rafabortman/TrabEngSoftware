require 'test_helper'

class LayoutTestTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "titles dynamic" do
   get jogadas_url
   assert_select "title", pageTitle("jogadas")
   get jogos_url
   assert_select "title", pageTitle("jogos")
   get usuarios_url
   assert_select "title", pageTitle("usuarios")
   get amigos_url
   assert_select "title", pageTitle("amigos")
end
end

