== README


[![Build Status](https://semaphoreci.com/api/v1/pascal/lockstockbarril/branches/master/badge.svg)](https://semaphoreci.com/pascal/lockstockbarril)

[Build Status](https://semaphoreci.com/api/v1/pascal/lockstockbarril/branches/master/badge.svg)


This application manages stock

The requirments are:

* users

* * have email, password

* * can edit update delete

* * * articles, brands, suppliers, supplies, supplies_in_stock, stocks, locations, addresses

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

* supply_in_stock

* * have article

* * have stock

* * have quantity

* * have location

* * have bought_price

* stocks

* * have name, address

* * have capacity

* * have locations

* * can have supply_in_stock

* locations

* * have name

* * have stock

* * can have supplies_in_stock

* * can have articles through supplies_in_stock

* address

* * have street

* * have street number

* * have additional information

* * have zip code

* * have town

* * state

* * country

* * can have supplier

* * can have stock