Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # this rules defines the following: when we recieve a `GET` request to `/`
  # which is the home page, send the request to the `Welcome` controller and
  # `index` action within that controller. An action is a public instance method
  # that is defined within the controller.
  # as: :home will generate a URL helper that will gives a view helper method
  # to auto-generate the URL

  # get('/', {to: 'welcome#index'})
  get('/', { to: 'welcome#index',as: :home })

  get('/contact', {to: 'contact#new'})
  # get '/contact', {to: 'contact#new'}
  # get '/contact', to: 'contact#new' #if last parameter is with # then you can
                                      #even remove curly braces

  post('/contact_submit', {to: 'contact#create'})
end
