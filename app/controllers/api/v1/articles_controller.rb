module Api
  module V1
    class ArticlesController < ApplicationController
      include CRUD
      resource_name 'article'
      additional_resources ['brand']
      permitted_attributes [:reference, :brand_id]
    end
  end
end
