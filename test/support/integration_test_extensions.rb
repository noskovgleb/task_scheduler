class ActionDispatch::IntegrationTest
  def http_authenticate(username, password)
    @credentials = ActionController::HttpAuthentication::Basic.encode_credentials(username, password)
  end

  %w(get post patch put delete).each do |http_method|
    define_method(http_method) do |path, **args|
      args[:headers] ||= {}
      args[:headers]['Authorization'] = @credentials if @credentials

      super(path, **args)
    end
  end
end