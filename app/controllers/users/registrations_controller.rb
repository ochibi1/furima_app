# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @user = User.new
    @deliver_address = @user.build_deliver_address
  end

  # POST /resource
  def create
    super
    deliver_address = DeliverAddress.new(deliver_address_params)
    @user.build_deliver_address(deliver_address.attributes)
    deliver_address.user_id = @user.id
    deliver_address.save
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [
                                                      :nickname, :first_name, :family_name,
                                                      :first_name_kana, :family_name_kana, :birth_date,
                                                      :introduction, :icon
                                                        ])
  end

  def deliver_address_params
    params.require(:deliver_address).permit(:post_code, :prefecture_code,
                                            :city, :house_number, :building_name,
                                            :destination_family_name, :destination_first_name,
                                            :destination_family_name_kana, :destination_first_name_kana,
                                            :phone_number)
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
