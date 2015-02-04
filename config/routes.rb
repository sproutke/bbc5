require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web, at: '/sidekiq'

  namespace :api do
    namespace :v1 do
      get "subscription/version"
      get "subscription/subscribers"

      post "subscription/sms" => "subscription#sms_subscribers"
      post "subscription/whatsapp" => "subscription#whatsapp_subscribers"
      get "subscription/wechat" => "subscription#wechat_api_registration"
    end
  end

end
