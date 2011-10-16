class BillsController < ApplicationController
  # GET /bills
  # GET /bills.xml
  def index
    @search = Bill.search(params[:search])
    @bills_print = @search.all
    @bills = @bills_print.paginate(:per_page=>20,:page=>params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bills }
    end
  end

  # GET /bills/1
  # GET /bills/1.xml
  def show
    @bill = Bill.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bill }
    end
  end
  
  # GET /bills/new
  # GET /bills/new.xml
  def new
    @patent_id=params[:patent]
    @patent=Patent.find(@patent_id)   
    @bills = Bill.find_all_by_patent_id(@patent_id)
    @bill = Bill.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bill }
    end
  end

  # GET /bills/1/edit
  def edit
    @bill = Bill.find(params[:id])
  end

  # POST /bills
  # POST /bills.xml
  def create
    @bill = Bill.new(params[:bill])

    respond_to do |format|
      if @bill.save
        if haben_anmelder_anteile?(@bill.patent)
        format.html { redirect_to(new_bill_path(:patent=>@bill.patent_id)) }
        format.xml  { render :xml => @bill, :status => :created, :location => @bill }
        else
        format.html { redirect_to(editsubmissions_patents_path(:id=>@bill.patent) )}
        end
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bill.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bills/1
  # PUT /bills/1.xml
  def update
    @bill = Bill.find(params[:id])

    respond_to do |format|
      if @bill.update_attributes(params[:bill])
        format.html { redirect_to(@bill, :notice => 'Bill was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bill.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bills/1
  # DELETE /bills/1.xml
  def destroy
    @bill = Bill.find(params[:id])
    @bill.destroy
    respond_to do |format|
      if params[:patent].blank?
      format.html { redirect_to(bills_url) }
      else
      format.html { redirect_to(new_bill_url(:patent=>params[:patent]) )}
      end
      format.xml  { head :ok }
    end
  end
  def pdf_rechnung
    @bill=Bill.find(params[:id])
    @datum=@bill.datum
    @patent=@bill.patent
    @user=@bill.user.name
    @submission= Submission.find_by_patent_id_and_submitter_id(@patent.id,@bill.user.id)
@anteil=sprintf('%.2f', @patent.preis(@submission)).gsub('.',',')

    @rechnungsnummer=@bill.rechnungsnummer
    respond_to do |format|
    format.pdf
    end
  end
 def pdf_bill_tabelle
    @bills=Bill.find(params[:bills])
    respond_to do |format|
      format.pdf
    end
    end

private
def haben_anmelder_anteile?(patent)
  help=true
  if patent.submissions.size==1
    patent.submissions.first.anteil=1
  end
  patent.submissions.each do |s| 
    help=help && !s.anteil.blank?
  end
  help
end
end

