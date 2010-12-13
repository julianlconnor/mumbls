class PaymentsController < ApplicationController
  
  def confirm
    if params[:transactionAmount].nil? and params[:transactionId].nil?
      # Someone is trying to access payments without an actual transaction
    else
      # Check to see if that transaction has already occured, if it has cancel
      @check_transaction = Payment.find(:first, :conditions => ["transaction_id = ?", params[:transactionId]])
      if !@check_transaction.nil?
        redirect_to(root_path, :notice => "Payment Failed : A transaction with that ID already exists.")
      else
        @add_cred = Credit.find(:first, :conditions => [ "user_id = ?", params[:user_id]])
        @add_cred.credits = @add_cred.credits + 2
        @add_cred.save
        @payment = Payment.new(
          :transaction_amount => params[:transactionAmount],
          :transaction_id     => params[:transactionId]
        )
        if @payment.save
          redirect_to(new_housing_path, :notice => 'You have succesfully purchased 2 credits!')
        else
          redirect_to :action => "index"
        end
      end
    end
  end
    
  # GET /payments
  # GET /payments.xml
  def index
    @user = UserSession.find
    if @user.nil?
      flash[:notice] = "Please sign in to create a new listing."
      redirect_to(:controller => "user_session", :action => "new")
    end
    
    @payments = Payment.all
    

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @payments }
    end
  end

  # GET /payments/1
  # GET /payments/1.xml
  def show
    @payment = Payment.find(params[:id])
  
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @payment }
    end
  end

  # GET /payments/new
  # GET /payments/new.xml
  def new
    @payment = Payment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @payment }
    end
  end

  # GET /payments/1/edit
  def edit
    @payment = Payment.find(params[:id])
  end

  # POST /payments
  # POST /payments.xml
  def create
    @payment = Payment.new(params[:payment])

    respond_to do |format|
      if @payment.save
        format.html { redirect_to(@payment, :notice => 'Payment was successfully created.') }
        format.xml  { render :xml => @payment, :status => :created, :location => @payment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @payment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /payments/1
  # PUT /payments/1.xml
  def update
    @payment = Payment.find(params[:id])

    respond_to do |format|
      if @payment.update_attributes(params[:payment])
        format.html { redirect_to(@payment, :notice => 'Payment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @payment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.xml
  def destroy
    @payment = Payment.find(params[:id])
    @payment.destroy

    respond_to do |format|
      format.html { redirect_to(payments_url) }
      format.xml  { head :ok }
    end
  end
end
