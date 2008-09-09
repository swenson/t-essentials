class AdsizesController < ApplicationController
  before_filter :authorize_admin
  
  
  # GET /adsizes
  # GET /adsizes.xml
  def index
    @adsizes = Adsize.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @adsizes }
    end
  end

  # GET /adsizes/1
  # GET /adsizes/1.xml
  def show
    @adsize = Adsize.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @adsize }
    end
  end

  # GET /adsizes/new
  # GET /adsizes/new.xml
  def new
    @adsize = Adsize.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @adsize }
    end
  end

  # GET /adsizes/1/edit
  def edit
    @adsize = Adsize.find(params[:id])
  end

  # POST /adsizes
  # POST /adsizes.xml
  def create
    @adsize = Adsize.new(params[:adsize])
    if params[:adsize][:standardprice]
      @adsize.standardprice = frommoney(params[:adsize][:standardprice])
    end

    respond_to do |format|
      if @adsize.save
        flash[:notice] = 'Adsize was successfully created.'
        format.html { redirect_to(@adsize) }
        format.xml  { render :xml => @adsize, :status => :created, :location => @adsize }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @adsize.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /adsizes/1
  # PUT /adsizes/1.xml
  def update
    @adsize = Adsize.find(params[:id])
    if params[:adsize][:standardprice]
      @adsize.standardprice = frommoney(params[:adsize][:standardprice])
      params[:adsize].delete :standardprice
    end

    respond_to do |format|
      if @adsize.update_attributes(params[:adsize])
        flash[:notice] = 'Adsize was successfully updated.'
        format.html { redirect_to(@adsize) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @adsize.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /adsizes/1
  # DELETE /adsizes/1.xml
  def destroy
    @adsize = Adsize.find(params[:id])
    @adsize.destroy

    respond_to do |format|
      format.html { redirect_to(adsizes_url) }
      format.xml  { head :ok }
    end
  end
end
