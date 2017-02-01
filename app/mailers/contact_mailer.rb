class ContactMailer < ActionMailer::Base
    default to: 'friendlystranger91@gmail.com'
    
    def contact_email(name,email,body)
        @name = name    
        @email = email
        @body = body
        mail(from:email, subject:'Contact froms Message')
    end

end
