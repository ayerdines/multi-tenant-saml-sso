class SamlIdentityProvider < ApplicationRecord
  belongs_to :organization

  def options
    {
      idp_sso_service_url: single_sign_on_url,
      idp_cert_fingerprint: certificate_fingerprint,
      idp_cert_fingerprint_algorithm: "http://www.w3.org/2001/04/xmldsig-more#rsa-sha256"
    }
  end

  def self.ransackable_associations(_auth_object = nil)
    ["organization"]
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[certificate_fingerprint created_at id id_value organization_id single_sign_on_url updated_at]
  end
end
