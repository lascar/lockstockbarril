require 'rails_helper'

describe Api::V1::AddressesController, type: :routing do

  it 'routes to #index' do
    expect(:get => '/api/addresses').to route_to(controller: 'api/v1/addresses', action: 'index')
  end

  it 'routes to #new' do
    expect(:get => '/api/addresses/new').to route_to(controller: 'api/v1/addresses', action: 'new')
  end

  it 'routes to #show' do
    expect(:get => '/api/addresses/1').to route_to(controller: 'api/v1/addresses', action: 'show', :id => '1')
  end

  it 'routes to #edit' do
    expect(:get => '/api/addresses/1/edit').to route_to(controller: 'api/v1/addresses', action: 'edit', :id => '1')
  end

  it 'routes to #create' do
    expect(:post => '/api/addresses').to route_to(controller: 'api/v1/addresses', action: 'create')
  end

  it 'routes to #update via PUT' do
    expect(:put => '/api/addresses/1').to route_to(controller: 'api/v1/addresses', action: 'update', :id => '1')
  end

  it 'routes to #update via PATCH' do
    expect(:patch => '/api/addresses/1').to route_to(controller: 'api/v1/addresses', action: 'update', :id => '1')
  end

  it 'routes to #destroy' do
    expect(:delete => '/api/addresses/1').to route_to(controller: 'api/v1/addresses', action: 'destroy', :id => '1')
  end

end
