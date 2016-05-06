require 'rails_helper'

describe Api::V1::UsersController, type: :routing do

  it 'routes to #show' do
    expect(get: '/api/users/1').to route_to(controller: 'api/v1/users', action: 'show', id: '1', format: :json)
  end

  it 'routes to #create' do
    expect(post: '/api/users/').to route_to(controller: 'api/v1/users', action: 'create', format: :json)
  end

  it 'routes to #update' do
    expect(patch: '/api/users/1').to route_to(controller: 'api/v1/users', action: 'update', id: '1', format: :json)
  end

  it 'routes to #destroy' do
    expect(delete: '/api/users/1').to route_to(controller: 'api/v1/users', action: 'destroy', id: '1', format: :json)
  end

  it 'routes to #obtain_token' do
    expect(post: '/api/users/obtain_token').to route_to(controller: 'api/v1/users', action: 'obtain_token', format: :json)
  end

end
