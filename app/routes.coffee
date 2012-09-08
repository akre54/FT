module.exports = (match) ->
  match '', 'home#index'
  match 'customers', 'customers#index'
  match 'customers/:id', 'customers#show'
