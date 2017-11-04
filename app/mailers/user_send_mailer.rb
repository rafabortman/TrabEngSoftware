class UserSendMailer < ApplicationMailer
   default :from => 'engsistemas2017@gmail.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def user_send_email(contato)
    @contato = contato
    mail( :from => @contato.email,:to => 'henriquebortoletti@gmail.com',
    :subject =>  @contato.assunto )
  end

end
