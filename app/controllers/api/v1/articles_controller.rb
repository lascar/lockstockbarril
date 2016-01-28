module Api
  module V1
    class ArticlesController < ApplicationController
      include CRUD
      resource_name 'article'
      permitted_attributes [:reference]
    end
  end
end
