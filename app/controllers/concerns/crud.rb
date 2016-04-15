# index, show, create, update and destroy
module CRUD
  extend ActiveSupport::Concern

  included do
    before_action :set_resource, only: [:show, :update, :destroy]
    before_action :set_resources, only: [:index]

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
    render json: @resources
  end

  # GET /articles/1.json
  def show
    render json: @resource
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

  def filter_resources(queries)
    return unless defined?(resource_querier)
    queries.each do|query|
      begin
        @resources = resource_querier.instance.filter(@resources, queries)
      rescue NoMethodError
        @resources = { errors: { title: 'NoMethodError', code: 'NoMethodError', detail: 'NoMethodError', status: :unprocessable_entity } }
      end
    end
  end

  def resource_querier
    begin
      (resource_name.classify + "Query").constantize
    rescue
      nil
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
    # TODO unsafe!
    queries = params.to_unsafe_hash()[:search]
    queries && filter_resources(queries)
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
