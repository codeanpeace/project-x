class FavoriteResourcesController < ApplicationController
  # GET /favorite_resources
  # GET /favorite_resources.json
  def index
    @favorite_resources = FavoriteResource.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @favorite_resources }
    end
  end

  # GET /favorite_resources/1
  # GET /favorite_resources/1.json
  def show
    @favorite_resource = FavoriteResource.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @favorite_resource }
    end
  end

  # GET /favorite_resources/new
  # GET /favorite_resources/new.json
  def new
    @favorite_resource = FavoriteResource.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @favorite_resource }
    end
  end

  # GET /favorite_resources/1/edit
  def edit
    @favorite_resource = FavoriteResource.find(params[:id])
  end

  # POST /favorite_resources
  # POST /favorite_resources.json
  def create
    @favorite_resource = FavoriteResource.new(params[:favorite_resource])

    respond_to do |format|
      if @favorite_resource.save
        format.html { redirect_to @favorite_resource, notice: 'Favorite resource was successfully created.' }
        format.json { render json: @favorite_resource, status: :created, location: @favorite_resource }
      else
        format.html { render action: "new" }
        format.json { render json: @favorite_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /favorite_resources/1
  # PUT /favorite_resources/1.json
  def update
    @favorite_resource = FavoriteResource.find(params[:id])

    respond_to do |format|
      if @favorite_resource.update_attributes(params[:favorite_resource])
        format.html { redirect_to @favorite_resource, notice: 'Favorite resource was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @favorite_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorite_resources/1
  # DELETE /favorite_resources/1.json
  def destroy
    @favorite_resource = FavoriteResource.find(params[:id])
    @favorite_resource.destroy

    respond_to do |format|
      format.html { redirect_to favorite_resources_url }
      format.json { head :no_content }
    end
  end
end
