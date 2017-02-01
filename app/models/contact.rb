class Contact < ActiveRecord::Base
    #validation on contacts forms
    validates :name, presence: true
    validates :email, presence: true
    validates :comments, presence: true
end

    