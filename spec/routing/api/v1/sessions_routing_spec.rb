require 'rails_helper'

describe Api::V1::SessionsController, type: :routing do

  it 'routes to #create' do
    expect(post: '/api/sessions').to route_to(controller: 'api/v1/sessions', action: 'create', format: :json)
  end

  it 'routes to #destroy' do
    expect(delete: '/api/sessions/1').to route_to(controller: 'api/v1/sessions', action: 'destroy', id: '1', format: :json)
  end

end
