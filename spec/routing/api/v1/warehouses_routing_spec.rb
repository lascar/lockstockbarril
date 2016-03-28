require 'rails_helper'

describe Api::V1::WarehousesController, type: :routing do

  it 'routes to #index' do
    expect(get: '/api/warehouses').to route_to(controller: 'api/v1/warehouses', action: 'index', format: :json)
  end

  it 'routes to #new' do
    expect(get: '/api/warehouses/new').to route_to(controller: 'api/v1/warehouses', action: 'new', format: :json)
  end

  it 'routes to #show' do
    expect(get: '/api/warehouses/1').to route_to(controller: 'api/v1/warehouses', action: 'show', id: '1', format: :json)
  end

  it 'routes to #edit' do
    expect(get: '/api/warehouses/1/edit').to route_to(controller: 'api/v1/warehouses', action: 'edit', id: '1', format: :json)
  end

  it 'routes to #create' do
    expect(post: '/api/warehouses').to route_to(controller: 'api/v1/warehouses', action: 'create', format: :json)
  end

  it 'routes to #update via PUT' do
    expect(put: '/api/warehouses/1').to route_to(controller: 'api/v1/warehouses', action: 'update', id: '1', format: :json)
  end

  it 'routes to #update via PATCH' do
    expect(patch: '/api/warehouses/1').to route_to(controller: 'api/v1/warehouses', action: 'update', id: '1', format: :json)
  end

  it 'routes to #destroy' do
    expect(delete: '/api/warehouses/1').to route_to(controller: 'api/v1/warehouses', action: 'destroy', id: '1', format: :json)
  end

end
