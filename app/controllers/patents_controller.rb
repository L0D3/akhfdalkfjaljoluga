class PatentsController < ApplicationController
#  before_filter :login_required
  # GET /patents
  # GET /patents.xml
  def index
    @patents=Patent.all(:order=>sort_column+" "+sort_direction)
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
    @users=User.find(:all)
    @patent = Patent.new
    @nation=params[:nation]
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @patent }
    end
  end
  def pdf_patent_tabelle
    @patents=Patent.all
    prawnto :prawn=>{:page_layout=>:landscape}, :inline=>false
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
  def pdf_patentübersicht
    pdf_help  
  end
  def pdf_patentliste
  end

  def edit_submissions
    @patent=Patent.find(params[:id])
    @submissions=@patent.submissions

  end
  def update_submissions
    Submission.update(params[:submissions].keys,params[:submissions].values)
    redirect_to patents_url
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
  def sort_column
    params[:sort]|| "Titel" 
  end
  def sort_direction
    params[:direction] ||"asc"
  end
  def pdf_help

    prawnto :prawn=>{:bottom_margin=>2}, :inline=>false
    @patent=Patent.find(params[:id])
    respond_to do |format|
      format.pdf
    end

  end

end
