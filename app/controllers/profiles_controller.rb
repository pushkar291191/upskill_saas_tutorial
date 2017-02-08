class ProfilesController < ApplicationController
    #Get request to /users/:user_id/profile/new
    def new
       @profile = Profile.new 
    end
    
    #when we get a post request with data 
    def create
        @user = User.find( params[:user_id] )
        # Create profile linked to this specific user
        @profile = @user.build_profile( profile_params)
        if @profile.save
            flash[:success] = "Profile is updated"
            redirect_to user_path( params[:user_id] )
        else
            render action: :new
        end
        
    end
    
    private
        def profile_params
            params.require(:profile).permit(:first_name, :last_name, :job_title, :phone_number, :contact_email, :description)
        end
    
    
end
