Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'localhost:8081' # or whatever your React Native dev server origin is
    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: false
  end
end 