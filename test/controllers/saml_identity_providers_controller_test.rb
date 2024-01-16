require "test_helper"

class SamlIdentityProvidersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @saml_identity_provider = saml_identity_providers(:one)
  end

  test "should get index" do
    get saml_identity_providers_url
    assert_response :success
  end

  test "should get new" do
    get new_saml_identity_provider_url
    assert_response :success
  end

  test "should create saml_identity_provider" do
    assert_difference("SamlIdentityProvider.count") do
      post saml_identity_providers_url, params: { saml_identity_provider: { certificate_fingerprint: @saml_identity_provider.certificate_fingerprint, organization_id: @saml_identity_provider.organization_id, single_sign_on_url: @saml_identity_provider.single_sign_on_url } }
    end

    assert_redirected_to saml_identity_provider_url(SamlIdentityProvider.last)
  end

  test "should show saml_identity_provider" do
    get saml_identity_provider_url(@saml_identity_provider)
    assert_response :success
  end

  test "should get edit" do
    get edit_saml_identity_provider_url(@saml_identity_provider)
    assert_response :success
  end

  test "should update saml_identity_provider" do
    patch saml_identity_provider_url(@saml_identity_provider), params: { saml_identity_provider: { certificate_fingerprint: @saml_identity_provider.certificate_fingerprint, organization_id: @saml_identity_provider.organization_id, single_sign_on_url: @saml_identity_provider.single_sign_on_url } }
    assert_redirected_to saml_identity_provider_url(@saml_identity_provider)
  end

  test "should destroy saml_identity_provider" do
    assert_difference("SamlIdentityProvider.count", -1) do
      delete saml_identity_provider_url(@saml_identity_provider)
    end

    assert_redirected_to saml_identity_providers_url
  end
end
