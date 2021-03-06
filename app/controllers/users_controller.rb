class UsersController < ApplicationController
  
  # GET /users/:id
  def show
    @user = User.find(params[:id])
    #debugger
  end
  
  # GET /users/new
  def new
    @user = User.new
  end
  
  #POST /users(+params)
  def create
    @user = User.new(user_params)
    # あたらしいユーザーの保存が成功するか否か
    if @user.save
      log_in @user
      # リダイレクトするまえにフラッシュする
      flash[:success] = "Welcome to the Sample App!"
      # GET /users/#{@user.id}
      redirect_to @user
      # redirect_to user_path(@user)
      # redirect_to user_path(@user.id)
      # redirect_to user_path(1) -> /users/1
    else
      render 'new'
    end
  end
  
  private
  # ここより下のソースコードは外側からアクセスできない（しない）と思いましょう
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end