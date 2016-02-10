require 'rails_helper'

describe Api::V1::SuppliesController, type: :routing do

  it 'routes to #index' do
    expect(get: '/api/supplies').to route_to(controller: 'api/v1/supplies', action: 'index', format: :json)
  end

  it 'routes to #new' do
    expect(get: '/api/supplies/new').to route_to(controller: 'api/v1/supplies', action: 'new', format: :json)
  end

  it 'routes to #show' do
    expect(get: '/api/supplies/1').to route_to(controller: 'api/v1/supplies', action: 'show', id: '1', format: :json)
  end

  it 'routes to #edit' do
    expect(get: '/api/supplies/1/edit').to route_to(controller: 'api/v1/supplies', action: 'edit', id: '1', format: :json)
  end

  it 'routes to #create' do
    expect(post: '/api/supplies').to route_to(controller: 'api/v1/supplies', action: 'create', format: :json)
  end

  it 'routes to #update via PUT' do
    expect(put: '/api/supplies/1').to route_to(controller: 'api/v1/supplies', action: 'update', id: '1', format: :json)
  end

  it 'routes to #update via PATCH' do
    expect(patch: '/api/supplies/1').to route_to(controller: 'api/v1/supplies', action: 'update', id: '1', format: :json)
  end

  it 'routes to #destroy' do
    expect(delete: '/api/supplies/1').to route_to(controller: 'api/v1/supplies', action: 'destroy', id: '1', format: :json)
  end

end
