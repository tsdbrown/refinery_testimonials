ActionController::Routing::Routes.draw do |map|
  map.resources :testimonials, :only => [:index]

  map.namespace(:admin) do |admin|
    admin.resources :testimonials
  end
end
