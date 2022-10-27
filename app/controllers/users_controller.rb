class UsersController < ApplicationController
  
  # アクセス制限の実装＞他人のユーザ情報編集画面に遷移できない
  # before_action :signed_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]
  
  def index
    @users = User.all
  end
  
  
  def show
    # controllerファイルの作成2
    # より詳しくはアプリケーションを完成させよう2＞15章
    @user = User.find(params[:id])
    @users = @user.books
  end

  def edit
    # bookのindexページの左側の作成(User info)
    # からのuserのeditページの作成
    @user = User.find(params[:id])
  end
  
  # userのupdate機能の作成
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
     redirect_to user_path(user.id)
    else
     render :edit
    end
  end
  
  
  private
  def user_params
    params.require(:user).permit(:name, :introduction, :image)  
  end
  
  # アクセス制限の実装＞他人のユーザ情報編集画面に遷移できない
  
  
end
