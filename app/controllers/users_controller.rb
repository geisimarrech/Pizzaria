class UsersController < ApplicationController
  respond_to :html, :js
  
  skip_before_filter :require_user, :only => [:new, :create]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
      if @user.save
        flash[:notice] = "Usuário criado com sucesso."
      else
        @user.errors
      end
    respond_with @user
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Cadastro atualizado com sucesso."
    end
    respond_with @user 
  end
  
end
