User.create!([
  {email: "toto@gmail.com", password: "toto1000", password_confirmation: "toto1000", name: "toto"}
])
User.last.update_attributes(access_token: 'toto@gmail.com:RzW48XEcs2ynHSMuyyyL')
Brand.create!([
  {name: "brand 1"},
  {name: "brand 2"},
])
Article.create!([
  {reference: "article 1", brand_id: 1},
  {reference: "article 2", brand_id: 2}
])
Stock.create!([
  {name: "stock 1", capacity: "20.0", "address_attributes": {street: "calle san juan de la cruz", street_number: "34", additional_information: "6", zipcode: "28016", town: "Madrid", state: "Madrid",country: "España"}},
  {name: "stock 2", capacity: "0.1", "address_attributes": {street: "calle del carmen", street_number: "44", additional_information: "5b", zipcode: "28006", town: "Madrid", state: "Madrid",country: "España"}}
])
Supplier.create!([
  {name: "supplier 1", "address_attributes": {street: "calle de la fe", street_number: "19", additional_information: "4a", zipcode: "28012", town: "Madrid", state: "Madrid",country: "España"}},
  {name: "supplier 2", "address_attributes": {street: "calle lagarta", street_number: "19", additional_information: "4a", zipcode: "28013", town: "Madrid", state: "Madrid",country: "España"}}
])
Supply.create!([
  {ref_supplier: 'ref_supp 1', article_id: 1, supplier_id: 1, price: "10.05"},
  {ref_supplier: 'ref_supp 2', article_id: 2, supplier_id: 1, price: "20"}
])
Location.create!([
  {name: 'location 1', stock_id: 1},
  {name: 'location 2', stock_id: 2}
])
