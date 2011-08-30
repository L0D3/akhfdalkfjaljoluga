class PatentProtocolsController < ApplicationController
  # GET /patent_protocols
  # GET /patent_protocols.xml
  def index
    if params[:search2].blank?
    @search = PatentProtocol.search(params[:search])
    @patent_protocols = @search.all.paginate(:per_page=>25,:page=>params[:page])
  end
    @seltransactions=PatentProtocol.find(:all, :conditions=>['comment Like ?',"%#{params[:search2]}%"])
  end

  # GET /patent_protocols/1
  # GET /patent_protocols/1.xml
  def show
    @patent_protocol = PatentProtocol.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @patent_protocol }
    end
  end

  # GET /patent_protocols/new
  # GET /patent_protocols/new.xml
  def new
    @patent_id=params[:patent]
    @patent_status=Patent.find(@patent_id).status
    @rechnung_bezahlt=Patent.find(@patent_id).rechnung_bezahlt
    @patent_protocol = PatentProtocol.new
    @transactions=PatentProtocol.find_all_by_patent_id(@patent_id)
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @patent_protocol }
    end
  end

  # GET /patent_protocols/1/edit
  def edit
    @patent_protocol = PatentProtocol.find(params[:id])
  end

  # POST /patent_protocols
  # POST /patent_protocols.xml
  def create
    @patent_protocol = PatentProtocol.new(params[:patent_protocol])
    @patent=Patent.find(@patent_protocol.patent_id)
    @patent.status=params["new_status"]
    @patent.rechnung_bezahlt=(params["rechnung_bezahlt"].to_i)
    respond_to do |format|
      if @patent_protocol.save && @patent.save
        format.xml  { render :xml => @patent_protocol, :status => :created, :location => @patent_protocol }
        format.html { redirect_to(new_patent_protocol_path(:patent=>@patent_protocol.patent_id)) }
      else 
        format.html { render :action => "new" }
        format.xml  { render :xml => @patent_protocol.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /patent_protocols/1
  # PUT /patent_protocols/1.xml
  def update
    @patent_protocol = PatentProtocol.find(params[:id])

    respond_to do |format|
      if @patent_protocol.update_attributes(params[:patent_protocol])
        format.html { redirect_to(@patent_protocol, :notice => 'PatentProtocol was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @patent_protocol.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /patent_protocols/1
  # DELETE /patent_protocols/1.xml
  def destroy
    @patent_protocol = PatentProtocol.find(params[:id])
    @patent_protocol.destroy

    respond_to do |format|
      format.html { redirect_to(patent_protocols_url) }
      format.xml  { head :ok }
    end
  end
end
