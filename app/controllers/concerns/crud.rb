module CRUD
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_user!
    before_action :set_resource, only: [:show, :edit, :update, :destroy]
    before_action :set_resources, only: [:index, :destroy]

    def self.resource_name(resources_name)
      define_method :resource_name do
        resources_name
      end 
    end 

    def self.permitted_attributes(allowed_params)
      define_method :permitted_attributes do
        allowed_params
      end 
    end 
  end 

  # GET /articles
  # GET /articles.json
  def index
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    set_resource_new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    set_resource_new(permit_attributes)
    respond_to do |format|
      if @resource.save
        format.html { redirect_to @resource, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @resource }
      else
        format.html { render :new }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @resource.update(permit_attributes)
        format.html { redirect_to @resource, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @resource }
      else
        format.html { redirect_to edit_resource_path, notice: 'unprocessable entity' }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @resource.destroy
    respond_to do |format|
      format.html { redirect_to resources_url, notice: 'Successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def resources_url
    self.send('api_' + resource_name.pluralize + '_path')
  end

  def edit_resource_path
    self.send('edit_api_' + resource_name + '_path')
  end

  def resource_as_param_key
    resource_name.to_sym
  end

  def set_resources
    begin
      instance_variable_set('@' + resource_name.pluralize, resource_name.classify.constantize.all)
      instance_variable_set('@resources', '@'+ resource_name.pluralize)
    rescue ActiveRecord::RecordNotFound
      false
    end
  end

  def set_resource_new(parameters=nil)
    instance_variable_set('@' + resource_name, resource_name.classify.constantize.new(parameters))
    instance_variable_set('@resource', '@' + resource_name)
  end

  def set_resource
    begin
      instance_variable_set('@' + resource_name, resource_name.classify.constantize.new(permit_attributes))
      instance_variable_set('@resource', '@' + resource_name)
    rescue ActiveRecord::RecordNotFound
      false
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def permit_attributes
    byebug
    params.require(resource_as_param_key).permit(*permitted_attributes)
  end
end
