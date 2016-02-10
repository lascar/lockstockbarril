require 'rails_helper'

describe Api::V1::ArticlesController, type: :routing do

  it 'routes to #index' do
    expect(get: '/api/articles').to route_to(controller: 'api/v1/articles', action: 'index', format: :json)
  end

  it 'routes to #show' do
    expect(get: '/api/articles/1').to route_to(controller: 'api/v1/articles', action: 'show', id: '1', format: :json)
  end

  it 'routes to #create' do
    expect(post: '/api/articles').to route_to(controller: 'api/v1/articles', action: 'create', format: :json)
  end

  it 'routes to #update via PUT' do
    expect(put: '/api/articles/1').to route_to(controller: 'api/v1/articles', action: 'update', id: '1', format: :json)
  end

  it 'routes to #update via PATCH' do
    expect(patch: '/api/articles/1').to route_to(controller: 'api/v1/articles', action: 'update', id: '1', format: :json)
  end

  it 'routes to #destroy' do
    expect(delete: '/api/articles/1').to route_to(controller: 'api/v1/articles', action: 'destroy', id: '1', format: :json)
  end

end
