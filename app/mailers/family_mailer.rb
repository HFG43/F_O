class FamilyMailer < ApplicationMailer
  default from: 'hernan.f.guemes@gmail.com'

  def send_access_token
    @family = params[:family]
    mail(to: @family.family_registration_email, subject: 'Family Organizer: your family Token')
  end  
end
