# market-place-tech-test


As a person from the marketing team.
So that we can offer our clients promotions on our products on our site.
I would like the site to have a promotions rules functionality added.

As a person from the marketing team.
So that we can change with our consumers tastes.
I would like the system to be flexible regarding promotional rules.

As a checkout person
So that the promotional rules can be added to our legacy checkout system
the checkout person must be able to scan the products in any order


## Shopping List

| Product code       | Name           | Price  |
| ------------- |:-------------:| -----:|
| 001     | Lavender heart  | £9.25 |
| 002    | Personalised cufflinks     |  £45.00 |
| 003| Kids T­-shirt    | £19.95  |


## Promotional Rules

If you spend over £60, then you get 10% off of your purchase

If you buy 2 or more lavender hearts then the price drops to £8.50.

## Existing Checkout Interface


The interface to our checkout looks like this (shown in Ruby):


```
co=Checkout.new(promotional_rules)
co.scan (item)
co.scan (item)
price=co.total```
