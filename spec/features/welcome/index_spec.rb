require 'rails_helper'

RSpec.describe 'welcome index page' do
  it 'can display welcome page' do
    visit '/'

    expect(page).to have_content("Yay! You're on Relational Rails")
  end
end
