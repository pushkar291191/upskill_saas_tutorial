class ContactsController < ApplicationController
    # GET request to /contact-us
    def new
        @contact = Contact.new
    end
    
    #POST request to /contacts
    def create
        #mass assignments of form fields into Contact object
        @contact = Contact.new(contact_params)
        if @contact.save
            #store form fields into variables
            name = params[:contact][:name]
            email = params[:contact][:email]
            body = params[:contact][:comments]
            #send email 
            ContactMailer.contact_email(name,email,body).deliver
            flash[:success] = "Message Sent"
            redirect_to new_contact_path
            
        else
            flash[:danger] = @contact.errors.full_messages.join(", ")
            redirect_to new_contact_path
        end
    end
    
    private
        def contact_params
            params.require(:contact).permit(:name, :email, :comments)
        end
end