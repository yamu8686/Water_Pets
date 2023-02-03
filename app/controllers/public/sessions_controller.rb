# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :user_state, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected
  #退会しているか判断するメソッド。退会後は、同じアカウントでは利用できない。
  def user_state
    # [処理内容1] 入力されたemailからアカウントを１件取得
    @user = User.find_by(email: params[:user][:email])
    # アカウントが取得できなかった場合、このメソッドを終了する
    return if !@user
    # [処理内容2] 取得したアカウントのパスワードが一致しているかを判別
    if @user.valid_password?(params[:user][:password]) && (@user.is_deleted == false) #有効なパスワードか確認する true && !false
      flash[:notice] = "退会済みです。再度ご登録お願いします。"
      # [処理内容3]
      redirect_to new_user_session_path
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
