require 'rails_helper'

describe Api::V1::SuppliesInWarehouseController, type: :routing do

  it 'routes to #index' do
    expect(get: '/api/supplies_in_warehouse').to route_to(controller: 'api/v1/supplies_in_warehouse', action: 'index', format: :json)
  end

  it 'routes to #new' do
    expect(get: '/api/supplies_in_warehouse/new').to route_to(controller: 'api/v1/supplies_in_warehouse', action: 'new', format: :json)
  end

  it 'routes to #show' do
    expect(get: '/api/supplies_in_warehouse/1').to route_to(controller: 'api/v1/supplies_in_warehouse', action: 'show', id: '1', format: :json)
  end

  it 'routes to #edit' do
    expect(get: '/api/supplies_in_warehouse/1/edit').to route_to(controller: 'api/v1/supplies_in_warehouse', action: 'edit', id: '1', format: :json)
  end

  it 'routes to #create' do
    expect(post: '/api/supplies_in_warehouse').to route_to(controller: 'api/v1/supplies_in_warehouse', action: 'create', format: :json)
  end

  it 'routes to #update via PUT' do
    expect(put: '/api/supplies_in_warehouse/1').to route_to(controller: 'api/v1/supplies_in_warehouse', action: 'update', id: '1', format: :json)
  end

  it 'routes to #update via PATCH' do
    expect(patch: '/api/supplies_in_warehouse/1').to route_to(controller: 'api/v1/supplies_in_warehouse', action: 'update', id: '1', format: :json)
  end

  it 'routes to #destroy' do
    expect(delete: '/api/supplies_in_warehouse/1').to route_to(controller: 'api/v1/supplies_in_warehouse', action: 'destroy', id: '1', format: :json)
  end

end
