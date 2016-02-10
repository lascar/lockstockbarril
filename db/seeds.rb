User.create!([
  {email: "pascal.carrie@gmail.com", password: "toto1000", password_confirmation: "toto1000", name: "pascal"}
])
Brand.create!([
  {name: "brand 1"},
  {name: "brand 2"},
])
Article.create!([
  {reference: "article 1", brand_id: 1},
  {reference: "article 2", brand_id: 2}
])
Stock.create!([
  {name: "stock 1", capacity: "20.0"},
  {name: "stock 2", capacity: "0.1"}
])
Supplier.create!([
  {name: "supplier 1"},
  {name: "supplier 2"}
])
Address.create!([
  {street: "calle argumoza", street_number: "19", additional_information: "4a", zipcode: "28012", town: "Madrid", state: "Madrid", country: "España", addresseable_id: 1, addresseable_type: "Supplier"},
  {street: "calle argumoza", street_number: "19", additional_information: "4a", zipcode: "28012", town: "Madrid", state: "Madrid", country: "España", addresseable_id: 1, addresseable_type: "Stock"}
])
Supply.create!([
  {ref_supplier: 'ref_supp 1', article_id: 1, supplier_id: 1, price: "10.05"},
  {ref_supplier: 'ref_supp 2', article_id: 2, supplier_id: 1, price: "20"}
])
