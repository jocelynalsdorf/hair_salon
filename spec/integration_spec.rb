require('capybara/rspec')
require('./app')
require('pry')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('path to adding a new SOMETHING', {:type => :feature}) do
  it('allows user to add new SOMETHING from the home page') do
    visit('/')
    click_link('SOMETHING')
    fill_in('name', :with => 'Epicodus Work')
    click_button('Add List')
    expect(page).to have_content('SOMETHING!')
  end
end