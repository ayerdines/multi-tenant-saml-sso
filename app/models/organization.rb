class Organization < ApplicationRecord
  extend FriendlyId

  friendly_id :name, use: :slugged

  has_one :saml_identity_provider, dependent: :destroy

  def self.ransackable_associations(auth_object = nil)
    ["saml_identity_provider"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "name", "slug", "updated_at"]
  end
end
