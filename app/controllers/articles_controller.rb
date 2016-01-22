class ArticlesController < ApplicationController
  include CRUD

  permitted_attributes [:reference]
end
