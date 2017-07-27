require 'rails_helper'

RSpec.describe "pages/landing.html.haml", type: :view do
  it 'renders landing' do
    render
    assert_select '#activities'
    assert_select '#places'
  end
end
