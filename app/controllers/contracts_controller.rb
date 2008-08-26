class ContractsController < ApplicationController
  before_filter :authorize


  def send_invoice
    @contract = Contract.find(params[:id])
    Invoicer.deliver_invoice(@contract)
    flash[:notice] = 'Delivered invoice'
    redirect_to(@contract)
  end



  # POST /comments
  # POST /comments.xml
  
  def delete_listing
    listing = Listing.find(params[:listing_id])
    listing.destroy
    
    @contract = Contract.find(params[:id])
    @newlisting = Listing.new
  end
     

  def add_listing
    if params[:listing] and params[:listing][:id]
      listing = Listing.find(params[:listing][:id])
      listing.update_attributes(params[:listing])
    else
      listing = Listing.new(params[:listing])
      listing.save
    end
    
    @contract = Contract.find(params[:id])
    @newlisting = Listing.new
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
