# index, show, create, update and destroy
module CRUD
  extend ActiveSupport::Concern

  included do
    respond_to :json
    before_action :authenticate_with_token!, only: [:create, :update, :destroy]
    before_action :set_resource, only: [:show, :update, :destroy]
    before_action :set_resources, only: [:index, :destroy]

    def self.resource_name(resource_name)
      define_method :resource_name do
        resource_name
      end
    end

    def self.permitted_attributes(allowed_params)
      define_method :permitted_attributes do
        allowed_params
      end
    end
  end

  # GET /articles.json
  def index
    respond_with @resources
  end

  # GET /articles/1.json
  def show
    respond_with @resource
  end

  # POST /articles.json
  def create
    set_resource_new(permit_attributes)
    if @resource.save
      render json: @resource, status: 201
    else
      render json: { errors: @resource.errors }, status: 422
    end
  end

  # PATCH/PUT /articles/1.json
  def update
    # delete_nested_ressources_updated
    if @resource.update(permit_attributes)
      render json: @resource, status: 200
    else
      render json: { errors: @resource.errors }, status: 422
    end
  end

  # DELETE /articles/1.json
  def destroy
    @resource.destroy
    head 204
  end

  private
  def delete_nested_ressources_updated
    params[resource_name].keys.grep(/_attributes/).each do |nested_ressources_updated|
      nested = nested_ressources_updated.gsub('_attributes', '')
      if nested == 'address'
        @resource.send(nested).destroy
      end
    end
  end

  def resource_as_param_key
    resource_name.to_sym
  end

  def set_resources
    begin
      instance_variable_set('@resources', resource_name.classify.constantize.all)
    rescue ActiveRecord::RecordNotFound
      head 404
    end
    params[:search] && filter_resourses
  end

  def filter_resourses
    queries = set_queries
    queries.each do|query|
      @resources = @resources.send(query.keys.first, query.values.first)
    end
  end

  def set_queries
    params[:search].keys.inject([]) do |queries, query|
      if @resources.respond_to? ('filter_by_' + query).to_sym
        queries.push({'filter_by_' + query => params[:search][query]})
      end
      queries
    end
  end

  def set_resource_new(parameters=nil)
    instance_variable_set('@resource', resource_name.classify.constantize.new(parameters))
  end

  def set_resource
    begin
      instance_variable_set('@resource', resource_name.classify.constantize.find(params[:id]))
    rescue ActiveRecord::RecordNotFound
      head 404
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def permit_attributes
    params.require(resource_as_param_key).permit(*permitted_attributes)
  end
end
