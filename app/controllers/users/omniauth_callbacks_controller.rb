class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :verify_authenticity_token, only: [:failure, :saml]

  def saml
    saml_response = request.env["omniauth.auth"].extra.try(:response_object)
    @organization = Organization.find_by_slug(params[:org_slug])

    @user = User.from_saml_response(saml_response, @organization)
    if @user.persisted?
      sign_in @user, :event => :authentication
      set_flash_message(:notice, :success, kind: "SAML") if is_navigational_format?
      redirect_to authenticated_index_path
    else
      session["devise.saml_data"] = request.env["omniauth.auth"].except(:extra) # Removing extra as it can overflow some session stores
      redirect_to new_user_registration_url
    end
  end
end
