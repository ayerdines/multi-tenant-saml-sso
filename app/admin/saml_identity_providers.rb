ActiveAdmin.register SamlIdentityProvider do
  permit_params :organization_id, :certificate_fingerprint, :single_sign_on_url
end
