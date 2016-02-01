require 'rails_helper'

module Api
  module V1
    describe BrandsController, type: :routing do

      it 'routes to #index' do
        expect(:get => '/api/brands').to route_to(controller: 'api/v1/brands', action: 'index')
      end

      it 'routes to #new' do
        expect(:get => '/api/brands/new').to route_to(controller: 'api/v1/brands', action: 'new')
      end

      it 'routes to #show' do
        expect(:get => '/api/brands/1').to route_to(controller: 'api/v1/brands', action: 'show', :id => '1')
      end

      it 'routes to #edit' do
        expect(:get => '/api/brands/1/edit').to route_to(controller: 'api/v1/brands', action: 'edit', :id => '1')
      end

      it 'routes to #create' do
        expect(:post => '/api/brands').to route_to(controller: 'api/v1/brands', action: 'create')
      end

      it 'routes to #update via PUT' do
        expect(:put => '/api/brands/1').to route_to(controller: 'api/v1/brands', action: 'update', :id => '1')
      end

      it 'routes to #update via PATCH' do
        expect(:patch => '/api/brands/1').to route_to(controller: 'api/v1/brands', action: 'update', :id => '1')
      end

      it 'routes to #destroy' do
        expect(:delete => '/api/brands/1').to route_to(controller: 'api/v1/brands', action: 'destroy', :id => '1')
      end

    end
  end
end
