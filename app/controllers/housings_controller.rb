class HousingsController < ApplicationController
  # GET /housings
  # GET /housings.xml
  def index
    @housings = Housing.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @housings }
    end
  end

  # GET /housings/1
  # GET /housings/1.xml
  def show
    @housing = Housing.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @housing }
    end
  end

  # GET /housings/new
  # GET /housings/new.xml
  def new
    @housing = Housing.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @housing }
    end
  end

  # GET /housings/1/edit
  def edit
    @housing = Housing.find(params[:id])
  end

  # POST /housings
  # POST /housings.xml
  def create
    @housing = Housing.new(params[:housing])

    respond_to do |format|
      if @housing.save
        format.html { redirect_to(@housing, :notice => 'Housing was successfully created.') }
        format.xml  { render :xml => @housing, :status => :created, :location => @housing }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @housing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /housings/1
  # PUT /housings/1.xml
  def update
    @housing = Housing.find(params[:id])

    respond_to do |format|
      if @housing.update_attributes(params[:housing])
        format.html { redirect_to(@housing, :notice => 'Housing was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @housing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /housings/1
  # DELETE /housings/1.xml
  def destroy
    @housing = Housing.find(params[:id])
    @housing.destroy

    respond_to do |format|
      format.html { redirect_to(housings_url) }
      format.xml  { head :ok }
    end
  end
end
