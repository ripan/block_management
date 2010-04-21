class BlocksController < ApplicationController
  # GET /blocks
  # GET /blocks.xml
  def index
    @blocks = Block.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @blocks }
    end
  end


  # GET /blocks/1
  # GET /blocks/1.xml
  def show
    @block = Block.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @block }
    end
  end

  # GET /blocks/new
  # GET /blocks/new.xml
  def new
    @block = Block.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @block }
    end
  end

  # GET /blocks/1/edit
  def edit
    @block = Block.find(params[:id])
  end

  # POST /blocks
  # POST /blocks.xml
  def create
    @block = Block.new(params[:block])

    respond_to do |format|
      if @block.save
        flash[:notice] = 'Block was successfully created.'
        format.html { redirect_to(@block) }
        format.xml  { render :xml => @block, :status => :created, :location => @block }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @block.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /blocks/1
  # PUT /blocks/1.xml
  def update
    @block = Block.find(params[:id])

    respond_to do |format|
      if @block.update_attributes(params[:block])
        flash[:notice] = 'Block was successfully updated.'
        format.html { redirect_to(@block) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @block.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /blocks/1
  # DELETE /blocks/1.xml
  def destroy
    @block = Block.find(params[:id])
    @block.destroy

    respond_to do |format|
      format.html { redirect_to(blocks_url) }
      format.xml  { head :ok }
    end
  end
  
  # Show block management screen
  def list
    @blocks = Block.find :all
    @categories = Category.find :all
  end
  
  def show_expiry_date 
    block = Block.find(params[:block_id])
    
    render :update do |page|
      if params[:category_name] == "Fire Risk Assessment"
        page.show("expiry_date#{block.id}") 
      else 
        page.hide("expiry_date#{block.id}")        
      end
      
      if params[:category_name] == "Asbestos Survey" and block.build_date.to_date < $config['build_date_lmit'].to_date
        page.hide("form_upload#{block.id}")
        page.alert("We are not able to upload Asbestos Survey for blocks built before 1st Jan 2000.")
      else  
        page.show("form_upload#{block.id}")
      end
      
    end
  end
  
  def show_upload_form
    block = Block.find(params[:id])
    render :update do |page|
      page.call 'popupChooseCategory', block.id
    end
  end
 
  def upload_document
    block = Block.find(params[:block_id])
    category = Category.find_by_name(params[:category_list])
    
    @document = Document.new(params["attachment_metadata"])
    @document.block = block
    @document.category = category
    @document.expiry_date = Date.civil(params[:post][:"expiry_date(1i)"].to_i,params[:post][:"expiry_date(2i)"].to_i,params[:post][:"expiry_date(3i)"].to_i)
    if @document.save
      flash[:notice] = 'Document was successfully uploaded.'
    else
      flash[:error] = 'Problem in uploading the documentt'
    end
    redirect_to :action => :list
  end
  
  # To upload document from the popup
  def write_popup_upload_document
    @block = Block.find(params[:id])
    @categories = Category.find :all
    render :partial => 'popup_upload_document'
  end
  
  # To show the file download dialogue box
  def download
    @document = Document.find(params[:id])
    @filepath = @document.full_filename
    send_file(@filepath,
      :disposition => 'attachment',
      :encoding => 'utf8',
      :type => 'application/octet-stream') 
  end
  
  # To delete the document
  def delete_document
    @document = Document.find(params[:id])
    @document.destroy
    flash[:notice] = 'Document successfully deleted. !'
    redirect_to :action => :list
  end
  
end
