class UserSessionsController < ApplicationController
  
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy
  
  respond_to :html, :js
  
  layout "login"

  def new
    @user = User.new
    respond_with(@user_session = UserSession.new)
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Login efetuado com sucesso!"      
    else
      flash[:notice] = "Usuário ou senha inválidos"
      render :action => :new
    end    
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_back_or_default new_user_session_url
  end
  
  def recover_password
    email = params[:email]
    @user = User.find_by_email(email)
    if @user
      RecoverPassword.new_email(@user).deliver
      flash[:notice] = "Verifique seu e-mail para ver seus dados de acesso"
    else
      flash[:notice] = "Não encontramos nenhum cadastro com seu e-mail."
    end
    respond_with @user
  end

end
