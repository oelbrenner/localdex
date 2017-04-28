class EpostcardMailer < ApplicationMailer
  default from: 'info@touristmarketing.com'
 
  def epostcard_mail(email)
    @email = email
    @epostcard = Epostcard.find(@email.epostcard_id)
    @lodging = Lodging.find(@email.lodging_id)
    @url = "http://localdex.herokuapp.com/emails/#{@email.id}"
    mail(to: @email.to_email,
         subject: 'you have an e-postcard',
         template_name: 'epostcard')
  end
end
