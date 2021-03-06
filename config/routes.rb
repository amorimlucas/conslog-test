Rails.application.routes.draw do
  	get 'project/index'
  	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  	resources :projects do
		resources :notes
	end
  	root 'projects#index'
  	get 'projects/conclude/:id', to: 'projects#conclude', as: 'conclude'
  	get 'projects/arquive/:id', to: 'projects#arquive', as: 'arquive'
  	post 'projects/bulk_arquive', to: 'projects#bulk_arquive', as: 'bulk_arquive'

  	get 'notes/arquive/:id', to: 'notes#arquive', as: 'arquive_note'

end
