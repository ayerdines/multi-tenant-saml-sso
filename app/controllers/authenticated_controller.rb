class AuthenticatedController < ApplicationController
  def index
    if request.env["omniauth.auth"].present?
      @sso_user = true
      @saml_attributes = request.env["omniauth.auth"].extra.try(:response_object).attributes.as_json
    else
      @sso_user = false
    end
  end
end
