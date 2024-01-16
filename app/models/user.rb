class User < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  ROLES = [
    ADMIN = 'admin',
    EMPLOYEE = 'user',
  ].freeze

  validates_presence_of :first_name, :last_name, :email, :role
  validates_uniqueness_of :email
  validates :role, inclusion: { in: ROLES }

  def admin?
    role == ADMIN
  end

  def self.from_saml_response(saml_response, _org)
    saml_attributes = saml_response.attributes
    email = saml_attributes.nameid
    first_name = saml_attributes.attributes["http://schemas.xmlsoap.org/ws/2005/05/identity/claims/givenname"]
    last_name = saml_attributes.attributes["http://schemas.xmlsoap.org/ws/2005/05/identity/claims/surname"]

    # Additional logic to check if the user belongs to the organization or not
    # You can add functionality to add the user to the organization if they don't exist
    find_or_initialize_by(email: email) do |u|
      u.first_name = first_name
      u.last_name = last_name
      u.role = User::EMPLOYEE
      u.provider = 'saml'
      u.uid = email
      u.password = Devise.friendly_token[0,20]
    end
  end
end
