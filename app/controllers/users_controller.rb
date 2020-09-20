class UsersController < ApplicationController

  def edit
  end

  def update
    if current_user.update(user_params) #current_userメソッドにユーザー情報が格納されている。
      redirect_to root_path #ログインに成功したらトップページに遷移する
    else
      render :edit #失敗したらrenderメソッドにより編集画面に戻ってくる。
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email) #ストロングパラメーター
  end
end
