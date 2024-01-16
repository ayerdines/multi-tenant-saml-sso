class CreateSamlIdentityProviders < ActiveRecord::Migration[7.1]
  def change
    create_table :saml_identity_providers do |t|
      t.references :organization, null: false, foreign_key: true, index: { unique: true }
      t.string :certificate_fingerprint
      t.string :single_sign_on_url

      t.timestamps
    end
  end
end
