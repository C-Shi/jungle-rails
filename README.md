# Jungle
A mini e-commerce application built with Rails 4.2

## Feature
### Sold Out Badge
* When a product has 0 quantity, a sold out badge is displayed on the product list page
### Admin Categories
* Basic HTTP Authentication for Admin Page
* Admin users can list and create new categories and products
### User Authentication
* As a Visitor I can go to the registration page from any page in order to create an account
* As a Visitor I can sign up for a user account with my e-mail, password, first name and last name
* As a Visitor I can sign in using my e-mail and password
* As a user, signing out will clear all the existing product in the cart
* Duplicate email signup is not allowed
### Order Details Page
* The order page contains items, their image, name, description, quantities and line item totals
* The final amount for the order is displayed
* User is not allowed to place order that is more than exisitng quantity
### Checking Out with Empty Cart
* Empty Cart cannot be checkout. Instead a warning message will be display
### Email Receipt
* One an order is placed, a confirmation email will be sent to the corresponding email
### Product Rating and Review
* As a visitor I can view the overall rating of products as I browse the catalog
* As a visitor I can view the list of ratings and reviews when viewing the product detail
* As a logged in user I can rate & review a product in a single step
* As a logged in user I can delete a rating or review that I previously created


## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Checking Out

When checking out, use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
