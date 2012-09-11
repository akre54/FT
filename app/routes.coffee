module.exports = (match) ->
  match '', 'farms#index'
  match 'customers', 'customers#index'
  match 'customers/:id', 'customers#show'
