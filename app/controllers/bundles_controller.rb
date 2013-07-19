class BundlesController < ApplicationController
  # GET /bundles
  # GET /bundles.json
  skip_before_filter :require_login, :only => [:new, :edit]

  def index
    @bundles = Bundle.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bundles }
    end
  end

  # GET /bundles/1
  # GET /bundles/1.json
  def show
    @bundle = Bundle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bundle }
    end
  end

  # GET /bundles/new
  # GET /bundles/new.json
  def new
    #use the self.standard_list method to get that list of standards associated w what they searched
    @bundle = Bundle.new
    @standard_list = Standard.standard_list(params[:subject], params[:grade], params[:topic])

    render :edit
  end

  # GET /bundles/1/edit
  def edit
    if params[:id] != nil
      @bundle = Bundle.find(params[:id])
    end

  end

  # POST /bundles
  # POST /bundles.json
  def make_bundle
    @bundle = Bundle.new
    @standards = params[:standards]
  end

  def create
    @bundle = Bundle.new(:user_id => current_user.id, :title => params[:bundle][:title], :description => params[:bundle][:description])
    #all the standards associated with a bundle when it was first searched. ie when it was first narrowed down by topic,
    #so that when the person returns to the page, they will see the same search results
    params[:standards].split(", ").each do |standard_id|
      @bundle.standards << Standard.find(standard_id)
    end

    respond_to do |format|
      if @bundle.save
        format.html { redirect_to edit_bundle_url(@bundle), notice: 'Bundle was successfully created.' }
        format.json { render json: @bundle, status: :created, location: @bundle }
      else
        format.html { render action: "new" }
        format.json { render json: @bundle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bundles/1
  # PUT /bundles/1.json
  def update
    @bundle = Bundle.find(params[:id])
    @bundle.resources << Resource.find(params[:resource])

    respond_to do |format|
      if @bundle.update_attributes(params[:bundle])
        format.html { redirect_to edit_bundle_url(@bundle), notice: 'Bundle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bundle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bundles/1
  # DELETE /bundles/1.json
  def destroy
    @bundle = Bundle.find(params[:id])
    @bundle.destroy

    respond_to do |format|
      format.html { redirect_to user_url(current_user.id) }
      format.json { head :no_content }
    end
  end
end
