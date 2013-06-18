class FavoriteBundlesController < ApplicationController
  # GET /favorite_bundles
  # GET /favorite_bundles.json
  def index
    @favorite_bundles = FavoriteBundle.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @favorite_bundles }
    end
  end

  # GET /favorite_bundles/1
  # GET /favorite_bundles/1.json
  def show
    @favorite_bundle = FavoriteBundle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @favorite_bundle }
    end
  end

  # GET /favorite_bundles/new
  # GET /favorite_bundles/new.json
  def new
    @favorite_bundle = FavoriteBundle.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @favorite_bundle }
    end
  end

  # GET /favorite_bundles/1/edit
  def edit
    @favorite_bundle = FavoriteBundle.find(params[:id])
  end

  # POST /favorite_bundles
  # POST /favorite_bundles.json
  def create
    @favorite_bundle = FavoriteBundle.new(params[:favorite_bundle])

    respond_to do |format|
      if @favorite_bundle.save
        format.html { redirect_to @favorite_bundle, notice: 'Favorite bundle was successfully created.' }
        format.json { render json: @favorite_bundle, status: :created, location: @favorite_bundle }
      else
        format.html { render action: "new" }
        format.json { render json: @favorite_bundle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /favorite_bundles/1
  # PUT /favorite_bundles/1.json
  def update
    @favorite_bundle = FavoriteBundle.find(params[:id])

    respond_to do |format|
      if @favorite_bundle.update_attributes(params[:favorite_bundle])
        format.html { redirect_to @favorite_bundle, notice: 'Favorite bundle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @favorite_bundle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorite_bundles/1
  # DELETE /favorite_bundles/1.json
  def destroy
    @favorite_bundle = FavoriteBundle.find(params[:id])
    @favorite_bundle.destroy

    respond_to do |format|
      format.html { redirect_to favorite_bundles_url }
      format.json { head :no_content }
    end
  end
end
