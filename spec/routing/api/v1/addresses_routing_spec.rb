require 'rails_helper'

describe Api::V1::AddressesController, type: :routing do

  it 'routes to #index' do
    expect(get: '/api/addresses').to route_to(controller: 'api/v1/addresses', action: 'index', format: :json)
  end

  it 'routes to #show' do
    expect(get: '/api/addresses/1').to route_to(controller: 'api/v1/addresses', action: 'show', id: '1', format: :json)
  end

  it 'routes to #create' do
    expect(post: '/api/addresses').to route_to(controller: 'api/v1/addresses', action: 'create', format: :json)
  end

  it 'routes to #update via PUT' do
    expect(put: '/api/addresses/1').to route_to(controller: 'api/v1/addresses', action: 'update', id: '1', format: :json)
  end

  it 'routes to #update via PATCH' do
    expect(patch: '/api/addresses/1').to route_to(controller: 'api/v1/addresses', action: 'update', id: '1', format: :json)
  end

  it 'routes to #destroy' do
    expect(delete: '/api/addresses/1').to route_to(controller: 'api/v1/addresses', action: 'destroy', id: '1', format: :json)
  end

end
