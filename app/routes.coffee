module.exports = (match) ->
  match '', 'farms'
  match 'customers', 'customers#index'
  match 'customers/create', 'customers#create'
  match 'customers/:id', 'customers#show', constraints: { id: /^\d+$/ }
