require('capybara/rspec')
require('./app')
require('pry')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('path to adding, deleting, &  viewing clients and stylists', {:type => :feature}) do
  it('allows user to add new stylist from the home page') do
    visit('/')
    click_link('Add New Stylist')
    fill_in('name', :with => 'Sally')
    click_button('Add Stylist')
    expect(page).to have_content('Success!')
  end

  it('allows user to view all stylists that have been added') do
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

  it('allows user to view all clients that have been added') do
    test_stylist = Stylist.new({:name => 'Judy', :id => nil})
    test_stylist.save()
    test_client = Client.new({:client_description => 'MrJones', :stylist_id => test_stylist.id()})
    test_client.save()
    visit('/')
    click_link('See all Clients')
    expect(page).to have_content('MrJones')
  end

  it('allows user to click on stylist name to view/add their clients') do
    test_stylist = Stylist.new({:name => 'Judy', :id => nil})
    test_stylist.save()
    test_client = Client.new({:client_description => 'MrJones', :stylist_id => test_stylist.id()})
    test_client.save()
    visit('/stylists')
    click_link(test_stylist.name())
    expect(page).to have_content(test_client.client_description)
  end

  it('allows user to get to the form to edit a particular stylist') do
    test_stylist = Stylist.new({:name => 'Judy', :id => nil})
    test_stylist.save()
    test_client = Client.new({:client_description => 'MrJones', :stylist_id => test_stylist.id()})
    test_client.save()
    visit("/stylists/#{test_stylist.id()}")
    click_link('Edit this stylist')
    expect(page).to have_content('Judy')
  end

  it('allows user to delete a stylist and their clients') do
    test_stylist = Stylist.new({:name => 'Judy', :id => nil})
    test_stylist.save()
    test_client = Client.new({:client_description => 'MrJones', :stylist_id => test_stylist.id()})
    test_client.save()
    visit("/stylists/#{test_stylist.id()}")
    click_link('Edit this stylist')
    expect(page).to have_content('Judy')
    click_button('Delete stylist')
    expect(page). to have_content('Success!')
  end

  it('allows user to edit a stylist by assigning new name') do
    test_stylist = Stylist.new({:name => 'Judy', :id => nil})
    test_stylist.save()
    test_client = Client.new({:client_description => 'MrJones', :stylist_id => test_stylist.id()})
    test_client.save()
    visit("/stylists/#{test_stylist.id()}")
    click_link('Edit this stylist')
    expect(page).to have_content('Judy')
    fill_in('name', :with => 'bobby')
    click_button('Update')
    expect(page). to have_content('Success!')
    click_link('Back')
    click_link('View All Stylists')
    expect(page). to have_content('bobby')
  end
  it('allows user to delete a client') do
    test_client = Client.new({:client_description => 'Judy', :stylist_id => 1})
    test_client.save()
    test_stylist = Stylist.new({:name => 'MrJones', :id => nil})
    test_stylist.save()
    visit("/clients/#{test_client.client_description()}")
    click_button('Delete Client')
    expect(page). to have_content('Success!')
  end

end