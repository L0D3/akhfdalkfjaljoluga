class FeesController < ApplicationController
  # GET /fees
  # GET /fees.xml
  def index
    @fees = Fee.find(:all)
    @pettypatentfees= PettyPatentFee.find(:all)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fees }
    end
  end

  # GET /fees/1
  # GET /fees/1.xml
  def show
    @fee = Fee.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @fee }
    end
  end

  # GET /fees/new
  # GET /fees/new.xml
  def new
    @fee = Fee.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fee }
    end
  end

  # GET /fees/1/edit
  def edit
    @fee = Fee.find(params[:id])
  end

  # POST /fees
  # POST /fees.xml
  def create
    @fee = Fee.new(params[:fee])

    respond_to do |format|
      if @fee.save
        flash[:notice] = 'Fee was successfully created.'
        format.html { redirect_to fees_path}
        format.xml  { render :xml => @fee, :status => :created, :location => @fee }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fee.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fees/1
  # PUT /fees/1.xml
  def update
    @fee = Fee.find(params[:id])

    respond_to do |format|
      if @fee.update_attributes(params[:fee])
        flash[:notice] = 'Fee was successfully updated.'
        format.html { redirect_to fees_path }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fee.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fees/1
  # DELETE /fees/1.xml
  def destroy
    @fee = Fee.find(params[:id])
    @fee.destroy

    respond_to do |format|
      format.html { redirect_to(fees_url) }
      format.xml  { head :ok }
    end
  end
end
