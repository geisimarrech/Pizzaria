
class RecoverPassword < ActionMailer::Base
  
  def new_email(user)
    @nome = user.name
    @message = "Olá #{@nome}, você solicitou sua senha para acesso ao sistema: #{user.password_salt} "
    mail(:to => "#{user.email}", :subject => "Lembrar Senha", :from => "suporte@sigfood.com") do |format|
      format.html { render 'recover_password' } #app/view/contact_email.html.erb
    end
  end
  
end
