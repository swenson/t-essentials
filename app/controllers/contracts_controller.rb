class ContractsController < ApplicationController
  before_filter :authorize

  # send an invoice
  def send_invoice
    @contract = Contract.find(params[:id])
    Invoicer.deliver_invoice(@contract)
    flash[:notice] = 'Delivered invoice'
    redirect_to(@contract)
  end



  # POST /comments
  # POST /comments.xml
  
  # DELETE (XML) listing  
  def delete_listing
    listing = Listing.find(params[:delete_listing_id])

    @contract = Contract.find(params[:id])
    @newwebad = WebAd.new
    @newlisting = Listing.new

    if listing.destroy
      respond_to do |format|
        flash[:notice] = 'Listing was successfully deleted.'
        format.html { redirect_to :action => :show_listings, :id => params[:id] }
        format.xml  { head :ok }
      end
    else
      respond_to do |format|
        format.html { redirect_to :action => :show_listings, :id => params[:id] }
        format.xml  { render :xml => listing.errors, :status => :unprocessable_entity }
      end
    end    
  end
     
  # POST listing
  def add_listing
    @contract = Contract.find(params[:id])
    @newwebad = WebAd.new
    @newlisting = Listing.new
    
    if params[:listing] and params[:listing][:id]
      listing = Listing.find(params[:listing][:id])
      if listing.update_attributes(params[:listing])
        respond_to do |format|
          flash[:notice] = 'Listing was successfully updated.'
          format.html { redirect_to :action => :show_listings, :id => params[:id] }
          format.xml  { head :ok }
        end
      else
        respond_to do |format|
          format.html { redirect_to :action => :show_listings, :id => params[:id] }
          format.xml  { render :xml => listing.errors, :status => :unprocessable_entity }
        end
      end

    else

      listing = Listing.new(params[:listing])
      if listing.save
        respond_to do |format|
          flash[:notice] = 'Listing was successfully added.'
          format.html { redirect_to :action => :show_listings, :id => params[:id] }
          format.xml  { head :ok }
        end
      else
        respond_to do |format|
          format.html { redirect_to :action => :show_listings, :id => params[:id] }
          format.xml  { render :xml => listing.errors, :status => :unprocessable_entity }
        end
      end
    end
  end
  
  def delete_web_ad
    web_ad = WebAd.find(params[:delete_web_ad_id])
    web_ad.destroy
    
    @contract = Contract.find(params[:id])
    @newwebad = WebAd.new
    @newlisting = Listing.new
  end
     

  def add_web_ad
    if params[:web_ad] and params[:web_ad][:id]
      web_ad = WebAd.find(params[:web_ad][:id])
      web_ad.update_attributes(params[:web_ad])
    else
      web_ad = WebAd.new(params[:web_ad])
      puts params[:web_ad][:type]
      puts web_ad.type
      web_ad.save
    end
    
    @contract = Contract.find(params[:id])
    @newwebad = WebAd.new
    @newlisting = Listing.new
    @upload = Upload.new
    @uploads = @contract.uploads
    
  end

  
  def delete_charge
    charge = Charge.find(params[:charge_id])
    charge.destroy
    
    @contract = Contract.find(params[:id])
    @comments = @contract.comments
    @newcomment = Comment.new
    @newpayment = Payment.new
    @newcharge = Charge.new
    @newad = Ad.new
    @upload = Upload.new
    @uploads = @contract.uploads
    
  end


  def delete_payment
    payment = Payment.find(params[:payment_id])
    payment.destroy
    
    @contract = Contract.find(params[:id])
    @comments = @contract.comments
    @newcomment = Comment.new
    @newpayment = Payment.new
    @newcharge = Charge.new
    @newad = Ad.new
    @upload = Upload.new
    @uploads = @contract.uploads
    
  end


  def delete_comment
    comment = Comment.find(params[:comment_id])
    comment.destroy
 
    @contract = Contract.find(params[:id])
    @comments = @contract.comments
    @newcomment = Comment.new
    @newpayment = Payment.new
    @newcharge = Charge.new
    @newad = Ad.new
    @upload = Upload.new
    @uploads = @contract.uploads
    
  end
  
  def delete_ad
    ad = Ad.find(params[:ad_id])
    ad.destroy

    @contract = Contract.find(params[:id])
    @comments = @contract.comments
    @newcomment = Comment.new
    @newpayment = Payment.new
    @newcharge = Charge.new
    @newad = Ad.new
    @upload = Upload.new  
    @uploads = @contract.uploads
  end

  def delete_upload
    upload = Upload.find(params[:upload_id])
    if upload.destroy
      flash[:notice] = 'Upload successfully deleted.'
    else
      flash[:notice] = 'Upload deletion failed.'
    end

    @contract = Contract.find(params[:id])
    @comments = @contract.comments
    @newcomment = Comment.new
    @newpayment = Payment.new
    @newcharge = Charge.new
    @newad = Ad.new
    @upload = Upload.new  
    @uploads = @contract.uploads
  end

  def add_upload
    @upload = Upload.new(params[:upload])
    if @upload.save
      flash[:notice] = 'Upload was successfully created.'
      redirect_to :action => "show", :id => params[:id]
    else
      flash[:notice] = 'Problem uploading file.'
      @contract = Contract.find(params[:id])
      @comments = @contract.comments
      @newcomment = Comment.new
      @newpayment = Payment.new
      @newcharge = Charge.new
      @newad = Ad.new
      #@upload = Upload.new
      @uploads = @contract.uploads
    
      render :action => :show, :id => params[:id]    
    end
  end


  def add_ad
    @ad = Ad.new(params[:ad])
    @ad.save
    
    @contract = Contract.find(params[:id])
    @comments = @contract.comments
    @newcomment = Comment.new
    @newpayment = Payment.new
    @newcharge = Charge.new
    @newad = Ad.new
    @upload = Upload.new
    @uploads = @contract.uploads    
    
  end


  def add_charge
    @charge = Charge.new(params[:charge])
    @charge.save
    
    @contract = Contract.find(params[:id])
    @comments = @contract.comments
    @newcomment = Comment.new
    @newpayment = Payment.new
    @newcharge = Charge.new
    @newad = Ad.new
    @upload = Upload.new
    @uploads = @contract.uploads    
    
  end
  
  def add_payment
    @payment = Payment.new(params[:payment])
    @payment.save

    @contract = Contract.find(params[:id])
    @comments = @contract.comments
    @newcomment = Comment.new
    @newpayment = Payment.new
    @newcharge = Charge.new
    @newad = Ad.new
    @upload = Upload.new
    @uploads = @contract.uploads    
    
  end
  
  def add_comment
    @comment = Comment.new(params[:comment])
 
    @comment.save
    
    @contract = Contract.find(params[:id])
    @comments = @contract.comments
    @newcomment = Comment.new
    @newpayment = Payment.new
    @newcharge = Charge.new
    @newad = Ad.new
    @upload = Upload.new
    @uploads = @contract.uploads    
    
    
    #respond_to do |format|
    #  format.html show.html.erb
    #  format.xml  { render :xml => @contract }
    #end
  end



  # GET /contracts
  # GET /contracts.xml
  def index
    if @user.admin
      @contracts = Contract.find(:all)
    else
      @contracts = Contract.find(:all, :conditions => "salesperson_id = #{@user.salesperson_id}")
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contracts }
    end
  end
  
  def show_listings
    @contract = Contract.find(params[:id])
    if params[:listing_id]
      @newlisting = Listing.find(params[:listing_id])
    else
      @newlisting = Listing.new
    end
    
    if params[:web_ad_id]
      @newwebad = WebAd.find(params[:web_ad_id])
    else
      @newwebad = WebAd.new
    end
  end
  
  
  # GET /contracts/1
  # GET /contracts/1.xml
  def show
    @contract = Contract.find(params[:id])
    @comments = @contract.comments
    @newpayment = Payment.new
    @newcharge = Charge.new
    @newcomment = Comment.new
    @newad = Ad.new
    @upload = Upload.new
    @uploads = @contract.uploads
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @contract }
    end
  end

  # GET /contracts/new
  # GET /contracts/new.xml
  def new
    @contract = Contract.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @contract }
    end
  end

  # GET /contracts/1/edit
  def edit
    @contract = Contract.find(params[:id])
  end

  # POST /contracts
  # POST /contracts.xml
  def create
    @contract = Contract.new(params[:contract])

    respond_to do |format|
      if @contract.save
        flash[:notice] = 'Contract was successfully created.'
        format.html { redirect_to(@contract) }
        format.xml  { render :xml => @contract, :status => :created, :location => @contract }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @contract.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contracts/1
  # PUT /contracts/1.xml
  def update
    @contract = Contract.find(params[:id])

    respond_to do |format|
      if @contract.update_attributes(params[:contract])
        flash[:notice] = 'Contract was successfully updated.'
        format.html { redirect_to(@contract) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @contract.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contracts/1
  # DELETE /contracts/1.xml
  def destroy
    @contract = Contract.find(params[:id])
    @contract.destroy

    respond_to do |format|
      format.html { redirect_to(contracts_url) }
      format.xml  { head :ok }
    end
  end
end
