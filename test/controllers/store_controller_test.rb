require 'test_helper'

class StoreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get store_index_url
    assert_response :success
    assert_select '#columns #side a', minimum: 4 #Al menos cuatro valores
    assert_select '#main .entry', 3 #Cuatro elementos de esta clase dentro del elemento de id main
    assert_select 'h3', 'Programming Ruby 1.9'
    assert_select '.price', /\$[,\d]+\.\d\d/ #Valido el formato de los precios
  end

end
