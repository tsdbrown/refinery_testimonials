ActionController::Routing::Routes.draw do |map|
  map.resources :testimonials, :only => [:index]

  map.namespace(:admin, :path_prefix => 'refinery') do |admin|
    admin.resources :testimonials
  end
end
