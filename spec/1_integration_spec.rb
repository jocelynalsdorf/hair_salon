require('capybara/rspec')
require('./app')
require('pry')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('path to adding, deleting,viewing clients and stylists ', {:type => :feature}) do
  it('allows user to add new stylist from the home page') do
    visit('/')
    click_link('Add New Stylist')
    fill_in('name', :with => 'Sally')
    click_button('Add Stylist')
    expect(page).to have_content('Success!')
  end

  it('allows user to view  all stylists from the home page') do
    visit('/')
    click_link('Add New Stylist')
    fill_in('name', :with => 'Sally')
    click_button('Add Stylist')
    expect(page).to have_content('Success!')
    click_link('Back')
    visit('/')
    click_link('View All Stylists')
    expect(page).to have_content('Sally')
  end

end