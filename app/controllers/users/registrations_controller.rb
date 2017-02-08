class Users::RegistrationsController < Devise::RegistrationsController
  #Extend default Devise gem behavior so that 
  #users sign up with Pro Accound (pland Id 2)
  #save with stripe subscription function otherwise use default function
  def create
    super do |resource|
      if params[:plan]
        resource.plan_id = params[:plan]
        if resource.plan_id == 2
          resource.save_with_subscription
        else
          resource.save
        end
      end
    end
  end
end