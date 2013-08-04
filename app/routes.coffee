module.exports = (match) ->
  match '', 'farms#index', name: 'home'
  match 'customers', 'customers#index', name: 'customers'
  match 'customers/new', 'customers#new', name: 'new_customer'
  match 'customers/:id', 'customers#show', name: 'customer', constraints: { id: /^\d+$/ }
  match 'login', 'accounts#login'
  match 'accounts/login', 'accounts#showLoginView', name: 'login'
  match 'accounts/logout', 'accounts#logout', name: 'logout'
