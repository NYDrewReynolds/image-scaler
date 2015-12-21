Rails.application.routes.draw do
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      get 'images/scale', to: 'images#scale_images'
    end
  end
end
