== README


[![Build Status](https://semaphoreci.com/api/v1/pascal/lockstockbarril/branches/master/badge.svg)](https://semaphoreci.com/pascal/lockstockbarril)


Rails 5 api and Spa

It 's a rails api that use rails capacity to manage the javascript templates to build a web in Spa without framework. For yet it uses jquery, handelbars and bootstrap but in a future it will use d3.js

The complete curl in in doc/complete_curl.txt

This application manages stock

The requirments are:

* users

* * have email, password

* * can edit update delete

* * * articles, brands, suppliers, supplies, supplies_in_warehouse, warehouses, locations, addresses

* articles

* * have brand, reference

* * * reference is uniq in a brand

* * can have supplies

* * * have supplier

* * * can have buying price

* * * can have a supplier's reference

* brands

* * have name

* suppliers

* * have name

* * can have addresse

* * can have supplies

* supply

* * have article

* * have supplier

* * have price

* supply_in_warehouse

* * have article

* * have warehouse

* * have quantity

* * have location

* * have bought_price

* warehouses

* * have name, address

* * have capacity

* * have locations

* * can have supply_in_warehouse

* locations

* * have name

* * have warehouse

* * can have supplies_in_warehouse

* * can have articles through supplies_in_warehouse

* address

* * have street

* * have street number

* * have additional information

* * have zip code

* * have town

* * state

* * country

* * can have supplier

* * can have warehouse

The prices and capacity are integer, the presentation have to deal with decimals
