require "application_system_test_case"

class SamlIdentityProvidersTest < ApplicationSystemTestCase
  setup do
    @saml_identity_provider = saml_identity_providers(:one)
  end

  test "visiting the index" do
    visit saml_identity_providers_url
    assert_selector "h1", text: "Saml identity providers"
  end

  test "should create saml identity provider" do
    visit saml_identity_providers_url
    click_on "New saml identity provider"

    fill_in "Certificate fingerprint", with: @saml_identity_provider.certificate_fingerprint
    fill_in "organization", with: @saml_identity_provider.organization_id
    fill_in "Single sign on url", with: @saml_identity_provider.single_sign_on_url
    click_on "Create Saml identity provider"

    assert_text "Saml identity provider was successfully created"
    click_on "Back"
  end

  test "should update Saml identity provider" do
    visit saml_identity_provider_url(@saml_identity_provider)
    click_on "Edit this saml identity provider", match: :first

    fill_in "Certificate fingerprint", with: @saml_identity_provider.certificate_fingerprint
    fill_in "organization", with: @saml_identity_provider.organization_id
    fill_in "Single sign on url", with: @saml_identity_provider.single_sign_on_url
    click_on "Update Saml identity provider"

    assert_text "Saml identity provider was successfully updated"
    click_on "Back"
  end

  test "should destroy Saml identity provider" do
    visit saml_identity_provider_url(@saml_identity_provider)
    click_on "Destroy this saml identity provider", match: :first

    assert_text "Saml identity provider was successfully destroyed"
  end
end
