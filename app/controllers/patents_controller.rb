class PatentsController < ApplicationController
#  before_filter :login_required
  # GET /patents
  # GET /patents.xml
  def index
    @search = Patent.search(params[:search])
    @patents_print = @search.all.sort_by(&:sort_by_fälligkeit)
    @patents = @search.all.sort_by(&:sort_by_fälligkeit).paginate(:per_page=>15,:page=>params[:page])
  end

  # GET /patents/1
  # GET /patents/1.xml
  def show
    @patent = Patent.find(params[:id])
 end
    # GET /patents/new
  # GET /patents/new.xml
  def new
    @users=User.find(:all)
    @patent = Patent.new
    @patent.status=1
    @nation=params[:nation]
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @patent }
    end
  end
  def pdf_patent_tabelle
    @patents=Patent.find(params[:patents])
    respond_to do |format|
      format.pdf
    end
    end

  def pdf_anfrage_eu
    pdf_help  
  end
  def pdf_anfrage_de
    pdf_help
  end
  def pdf_erinnerung1_eu
    pdf_help  
  end
  def pdf_erinnerung1_de
    pdf_help
  end
  def pdf_erinnerung2_eu
    pdf_help  
  end
  def pdf_erinnerung2_de
    pdf_help
  end
  def pdf_rechnung_eu
    pdf_help  
  end
  def pdf_rechnung_de
    pdf_help
  end
  def pdf_patentliste
  end

  def editsubmissions
    @patent=Patent.find(params[:id])
    @submissions=@patent.submissions

  end
  def updatesubmissions
    @patent=Patent.find(params[:patentid])
    anteil=0
    params[:submissions].values.each do |a|
      anteil+=a.values_at("anteil").first.to_i
    end
    if anteil==100
      Submission.update(params[:submissions].keys,params[:submissions].values)
      flash[:notice] = 'Anteile am Patent wurden erfolgreich geändert.'
      redirect_to @patent
    else
      flash[:notice] = 'Die Summe der Anteile muss 100 betragen'
      redirect_to :back
    end
  end
  def edit
    @users=User.find(:all)
    @patent = Patent.find(params[:id])
  end

  # POST /patents
  # POST /patents.xml
  def create
    @patent = Patent.new(params[:patent])
    @users=User.all(:conditions=>"telefon is NULL") 
    respond_to do |format|
      if @patent.save
        if @patent.submissions.size==1
          flash[:notice] = 'Patent was successfully created.'
          format.html { redirect_to(@patent) }
        else
         format.html{render :action=>"edit_submissions",:id=>@patent.id}

        end
#        else 
#          users="";
#          @users.each do |u|
#             users+=u.name+","
#          end
#          flash[:notice] = "Bitte editieren Sie folgende User: "+users
#          format.html {redirect_to edit_individually_users_path }
#        end
      else
          flash[:notice] = 'Error!'
        format.html { render :action => "new" }
  #      format.xml  { render :xml => @patent.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /patents/1
  # PUT /patents/1.xml
  def update
    @patent = Patent.find(params[:id])

    respond_to do |format|
      if @patent.update_attributes(params[:patent])
        flash[:notice] = 'Patent was successfully updated.'
        format.html {render :action =>"edit"}
          format.html { redirect_to(@patent) }
        format.xml  { head :ok }
      end
    end
  end

  def destroy
    @patent = Patent.find(params[:id])
    @patent.destroy

    respond_to do |format|
      format.html { redirect_to(patents_url) }
      format.xml  { head :ok }
    end
  end
  def newDE
  end

  private 
    def pdf_help
    prawnto :prawn=>{:bottom_margin=>2}, :inline=>false
    @patent=Patent.find(params[:id])
    respond_to do |format|
      format.pdf
    end

  end

end
