class PettyPatentFeesController < ApplicationController
  def update
    @fee =PettyPatentFee.find(params[:id])
    respond_to do |format|
      if @fee.update_attributes(params[:petty_patent_fee])
        flash[:notice] = 'Fee was successfully updated.'
        format.html { redirect_to fees_path }
      else
        format.html { render :action => "edit" }
      end
    end

  end
  def create
    @fee = PettyPatentFee.new(params[:petty_patent_fee])
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
  def destroy
    @fee = PettyPatentFee.find(params[:id])
    @fee.destroy
    respond_to do |format|
    format.html { redirect_to(fees_url) }
    end
  end 
  def edit
  @petty_patent_fee=PettyPatentFee.find(params[:id])
  end
  def new
   @petty_patent_fee =PettyPatentFee.new 
  end

end
