class PatentsController < ApplicationController
  # GET /patents
  # GET /patents.xml
  def index
    @patents = Patent.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @patents }
    end
  end

  # GET /patents/1
  # GET /patents/1.xml
  def show
    @patent = Patent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @patent }
    end
  end

  # GET /patents/new
  # GET /patents/new.xml
  def new
    @patent = Patent.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @patent }
    end
  end

  # GET /patents/1/edit
  def edit
    @patent = Patent.find(params[:id])
  end

  # POST /patents
  # POST /patents.xml
  def create
    @patent = Patent.new(params[:patent])

    respond_to do |format|
      if @patent.save
        format.html { redirect_to(@patent, :notice => 'Patent was successfully created.') }
        format.xml  { render :xml => @patent, :status => :created, :location => @patent }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @patent.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /patents/1
  # PUT /patents/1.xml
  def update
    @patent = Patent.find(params[:id])

    respond_to do |format|
      if @patent.update_attributes(params[:patent])
        format.html { redirect_to(@patent, :notice => 'Patent was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @patent.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /patents/1
  # DELETE /patents/1.xml
  def destroy
    @patent = Patent.find(params[:id])
    @patent.destroy

    respond_to do |format|
      format.html { redirect_to(patents_url) }
      format.xml  { head :ok }
    end
  end
end
