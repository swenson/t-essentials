class DesignersController < ApplicationController
  before_filter :authorize_admin
  
  # GET /designers
  # GET /designers.xml
  def index
    @designers = Designer.find(:all, :order => 'lastname, firstname')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @designers }
    end
  end

  # GET /designers/1
  # GET /designers/1.xml
  def show
    @designer = Designer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @designer }
    end
  end

  # GET /designers/new
  # GET /designers/new.xml
  def new
    @designer = Designer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @designer }
    end
  end

  # GET /designers/1/edit
  def edit
    @designer = Designer.find(params[:id])
  end

  # POST /designers
  # POST /designers.xml
  def create
    @designer = Designer.new(params[:designer])

    respond_to do |format|
      if @designer.save
        flash[:notice] = 'Designer was successfully created.'
        format.html { redirect_to(@designer) }
        format.xml  { render :xml => @designer, :status => :created, :location => @designer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @designer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /designers/1
  # PUT /designers/1.xml
  def update
    @designer = Designer.find(params[:id])

    respond_to do |format|
      if @designer.update_attributes(params[:designer])
        flash[:notice] = 'Designer was successfully updated.'
        format.html { redirect_to(@designer) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @designer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /designers/1
  # DELETE /designers/1.xml
  def destroy
    @designer = Designer.find(params[:id])
    @designer.destroy

    respond_to do |format|
      format.html { redirect_to(:action => 'index') and return }
      format.xml  { head :ok }
    end
  end
end
