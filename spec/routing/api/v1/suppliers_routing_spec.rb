require 'rails_helper'

describe Api::V1::SuppliersController, type: :routing do

  it 'routes to #index' do
    expect(get: '/api/suppliers').to route_to(controller: 'api/v1/suppliers', action: 'index', format: :json)
  end

  it 'routes to #new' do
    expect(get: '/api/suppliers/new').to route_to(controller: 'api/v1/suppliers', action: 'new', format: :json)
  end

  it 'routes to #show' do
    expect(get: '/api/suppliers/1').to route_to(controller: 'api/v1/suppliers', action: 'show', id: '1', format: :json)
  end

  it 'routes to #edit' do
    expect(get: '/api/suppliers/1/edit').to route_to(controller: 'api/v1/suppliers', action: 'edit', id: '1', format: :json)
  end

  it 'routes to #create' do
    expect(post: '/api/suppliers').to route_to(controller: 'api/v1/suppliers', action: 'create', format: :json)
  end

  it 'routes to #update via PUT' do
    expect(put: '/api/suppliers/1').to route_to(controller: 'api/v1/suppliers', action: 'update', id: '1', format: :json)
  end

  it 'routes to #update via PATCH' do
    expect(patch: '/api/suppliers/1').to route_to(controller: 'api/v1/suppliers', action: 'update', id: '1', format: :json)
  end

  it 'routes to #destroy' do
    expect(delete: '/api/suppliers/1').to route_to(controller: 'api/v1/suppliers', action: 'destroy', id: '1', format: :json)
  end

end
