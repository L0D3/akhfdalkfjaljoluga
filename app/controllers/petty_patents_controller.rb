class PettyPatentsController < ApplicationController
  # GET /petty_patents
  # GET /petty_patents.xml
  def index
    @search = Patent.search(params[:search])
    @sort=params[:search][:meta_sort] unless params[:search].nil?
    @patents_print = @search.where(:patent_type=>"Gebrauchsmuster").all
    @patents = @patents_print.paginate(:per_page=>15,:page=>params[:page])

  end

  # GET /petty_patents/1
  # GET /petty_patents/1.xml
  def pdf_table
    help=Patent.where(:id=>params[:patents])
    help=help.order(params[:sort].gsub('.',' ')) unless params[:sort].nil?
    @patents=help.all
    respond_to do |format|
      format.pdf
    end
  end
  def show
    @patent = Patent.find(params[:id])
  end

  # GET /petty_patents/new
  # GET /petty_patents/new.xml
  def new
    @patent = Patent.new
    @nation=params[:nation]
    @patent.status=1
    @patent.patent_type="Gebrauchsmuster"
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @petty_patent }
    end
  end

  # GET /petty_patents/1/edit
  def edit
    @petty_patent = PettyPatent.find(params[:id])
  end

  # POST /petty_patents
  # POST /petty_patents.xml
  def create
    @patent = Patent.new(params[:patent])
    @patent.patent_type="Gebrauchsmuster"
    @patent.status="aktiv" if @patent.status.nil?
    respond_to do |format|
      if @patent.save
        format.html { redirect_to petty_patent_path(@patent.id)}
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /petty_patents/1
  # PUT /petty_patents/1.xml
  def update
    @petty_patent = PettyPatent.find(params[:id])

    respond_to do |format|
      if @petty_patent.update_attributes(params[:petty_patent])
          flash[:notice] = 'Patent was successfully created.'
        format.html { redirect_to(@petty_patent, :notice => 'Petty patent was successfully updated.') }
        format.xml  { head :ok }
      else
        flash[:notice] = 'Error!'
        format.html { render :action => "edit" }
        format.xml  { render :xml => @petty_patent.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /petty_patents/1
  # DELETE /petty_patents/1.xml
  def destroy
    @petty_patent = PettyPatent.find(params[:id])
    @petty_patent.destroy

    respond_to do |format|
      format.html { redirect_to(petty_patents_url) }
      format.xml  { head :ok }
    end
  end
end
