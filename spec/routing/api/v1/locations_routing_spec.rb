require 'rails_helper'

describe Api::V1::LocationsController, type: :routing do

  it 'routes to #index' do
    expect(:get => '/api/locations').to route_to(controller: 'api/v1/locations', action: 'index')
  end

  it 'routes to #new' do
    expect(:get => '/api/locations/new').to route_to(controller: 'api/v1/locations', action: 'new')
  end

  it 'routes to #show' do
    expect(:get => '/api/locations/1').to route_to(controller: 'api/v1/locations', action: 'show', :id => '1')
  end

  it 'routes to #edit' do
    expect(:get => '/api/locations/1/edit').to route_to(controller: 'api/v1/locations', action: 'edit', :id => '1')
  end

  it 'routes to #create' do
    expect(:post => '/api/locations').to route_to(controller: 'api/v1/locations', action: 'create')
  end

  it 'routes to #update via PUT' do
    expect(:put => '/api/locations/1').to route_to(controller: 'api/v1/locations', action: 'update', :id => '1')
  end

  it 'routes to #update via PATCH' do
    expect(:patch => '/api/locations/1').to route_to(controller: 'api/v1/locations', action: 'update', :id => '1')
  end

  it 'routes to #destroy' do
    expect(:delete => '/api/locations/1').to route_to(controller: 'api/v1/locations', action: 'destroy', :id => '1')
  end

end
