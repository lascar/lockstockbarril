User.create!([
  {email: "toto@gmail.com", name: "toto"}
])
Brand.create!([
  {name: "brand 1"},
  {name: "brand 2"},
])
Article.create!([
  {reference: "article 1", brand_id: 1},
  {reference: "article 2", brand_id: 2}
])
Warehouse.create!([
  {name: "warehouse 1", capacity: "2000", "address_attributes": {street: "calle san juan de la cruz", street_number: "34", additional_information: "6", zipcode: "28016", town: "Madrid", state: "Madrid",country: "España"}},
  {name: "warehouse 2", capacity: "10", "address_attributes": {street: "calle del carmen", street_number: "44", additional_information: "5b", zipcode: "28006", town: "Madrid", state: "Madrid",country: "España"}}
])
Supplier.create!([
  {name: "supplier 1", "address_attributes": {street: "calle de la fe", street_number: "19", additional_information: "4a", zipcode: "28012", town: "Madrid", state: "Madrid",country: "España"}},
  {name: "supplier 2", "address_attributes": {street: "calle lagarta", street_number: "19", additional_information: "4a", zipcode: "28013", town: "Madrid", state: "Madrid",country: "España"}}
])
Supply.create!([
  {ref_supplier: 'ref_supp 1', article_id: 1, supplier_id: 1, price: "1005"},
  {ref_supplier: 'ref_supp 2', article_id: 2, supplier_id: 1, price: "2000"}
])
Location.create!([
  {name: 'location 1', warehouse_id: 1},
  {name: 'location 2', warehouse_id: 2}
])
SupplyInWarehouse.create!([
  {article_id: Article.first.id, supply_id: Supply.first.id, warehouse_id: 1, location_id: Location.first.id, bought_price_unit: 1000, quantity: 2, bought_date: Date.today - 3.months},
  {article_id: Article.last.id, supply_id: Supply.last.id, warehouse_id: 2, location_id: Location.last.id, bought_price_unit: 2000, quantity: 4, bought_date: Date.today - 2.months}
])
