Rails.application.config.middleware.use OmniAuth::Builder do
  OmniAuth::MultiProvider.register(self,
                                   provider_name: :saml,
                                   identity_provider_id_regex: /[A-Za-z0-9-]+/,
                                   path_prefix: '/users/auth/saml',
                                   issuer: 'MultiTenantSSO',
                                   allowed_clock_drift: 5.seconds) do |org_slug, _env|
    org = Organization.find_by_slug!(org_slug)
    identity_provider = org.saml_identity_provider
    identity_provider.options
  end

  on_failure do |env|
    env['devise.mapping'] = Devise.mappings[:user]
    Users::OmniauthCallbacksController.action(:failure).call(env)
  end
end
