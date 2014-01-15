class AdminsController < ApplicationController
  # GET /admins
  # GET /admins.json
   layout 'admin'
 
  def index
    @admins = Admin.order("admins.created_at DESC").paginate(:page => params[:page],:per_page =>10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admins }
    end
  end

  # GET /admins/1
  # GET /admins/1.json
  def show
    @admin = Admin.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin }
    end
  end

  # GET /admins/new
  # GET /admins/new.json
  def new
    @admin = Admin.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin }
    end
  end

  # GET /admins/1/edit
  def edit
    @admin = Admin.find(params[:id])
  end

  # POST /admins
  # POST /admins.json
  def create
    @admin = Admin.new(params[:admin])

    respond_to do |format|
      if @admin.save
        format.html { redirect_to @admin, notice: 'Admin was successfully created.' }
        format.json { render json: @admin, status: :created, location: @admin }
      else
        format.html { render action: "new" }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admins/1
  # PUT /admins/1.json
  def update
    @admin = Admin.find(params[:id])

    respond_to do |format|
      if @admin.update_attributes(params[:admin])
        format.html { redirect_to @admin, notice: 'Admin was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/1
  # DELETE /admins/1.json
  def destroy
    @admin = Admin.find(params[:id])
    @admin.destroy

    respond_to do |format|
      format.html { redirect_to admins_url }
      format.json { head :no_content }
    end
  end
  
#--------------Creating Members----------------
  
  def listMembers
    @members=Member.order("members.created_at DESC").paginate(:page => params[:page],:per_page =>3)
    
  end
    
  def newMember
    @member=Member.new
  end
  


  def createMember
    @member=Member.new(params[:member]) 
    
    #Save the object
      if @member.save
    #If save succeeds redirect to list 
    flash[:notice]= "Member --"+@member.username+"--created successfully"
      redirect_to(:action=>'listMembers')
    #else redislay the form so user can fix the problem
      else
        flash[:notice]= "Member "+ @member.username+" cannot be added. "
          render('newMember')
      end
  end
  
   def editMember
       #Find the object using form parameters
       @member=Member.find(params[:id])
       end

    def updateMember
         #Find the object using form parameters
         @member=Member.find(params[:id])
         #update with new values
         @member.update_attributes(params[:member])
         #Save the object
         if @member.save
           #If update succeeds redirect to list 
           flash[:notice]= "Member details for --"+@member.last_name+"--updated successfully"
           redirect_to(:action=>'listMembers')
         else
            flash[:notice]= "Member details for"+ @member.last_name+" cannot be updated. "
           render('newMember')
         end
         end
  
  
  
          def deleteMember
            #Find the object using form parameters
            @member=Member.find(params[:id])
            end
          def destroyMember
               #Find the object using form parameters
               @member=Member.find(params[:id])
                if @member.destroy
                  flash[:notice]="Member   "+@member.first_name+" deleted successfully"
                   redirect_to(:action =>'list')  
                   else
                      flash[:notice]="Member   "+@member.first_name+" cannot be deleted"   
                end
          end
  
  
  
  
  
  
end
