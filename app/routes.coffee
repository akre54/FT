module.exports = (match) ->
  match '', 'farms'
  match 'customers', 'customers#index'
  match 'customers/:id', 'customers#show'
