require 'rails_helper'

describe Api::V1::StocksController, type: :routing do

  it 'routes to #index' do
    expect(:get => '/api/stocks').to route_to(controller: 'api/v1/stocks', action: 'index')
  end

  it 'routes to #new' do
    expect(:get => '/api/stocks/new').to route_to(controller: 'api/v1/stocks', action: 'new')
  end

  it 'routes to #show' do
    expect(:get => '/api/stocks/1').to route_to(controller: 'api/v1/stocks', action: 'show', :id => '1')
  end

  it 'routes to #edit' do
    expect(:get => '/api/stocks/1/edit').to route_to(controller: 'api/v1/stocks', action: 'edit', :id => '1')
  end

  it 'routes to #create' do
    expect(:post => '/api/stocks').to route_to(controller: 'api/v1/stocks', action: 'create')
  end

  it 'routes to #update via PUT' do
    expect(:put => '/api/stocks/1').to route_to(controller: 'api/v1/stocks', action: 'update', :id => '1')
  end

  it 'routes to #update via PATCH' do
    expect(:patch => '/api/stocks/1').to route_to(controller: 'api/v1/stocks', action: 'update', :id => '1')
  end

  it 'routes to #destroy' do
    expect(:delete => '/api/stocks/1').to route_to(controller: 'api/v1/stocks', action: 'destroy', :id => '1')
  end

end
