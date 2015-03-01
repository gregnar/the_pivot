[![Code Climate](https://codeclimate.com/github/Copywright/the_pivot/badges/gpa.svg)](https://codeclimate.com/github/Copywright/the_pivot)

##Airlift

Technology has a huge role to play in disaster relief and recovery. With Airlift, relief organizations can order disaster supplies from multiple vendors simultaneously, and then use Google Maps to pinpoint where the supplies will be air dropped.

* Users register on the site as either suppliers (*the business*) or service
providers (*the customer*)
* A supplier has a listings page with all their available supplies
* A listing has a title, description, categories, quantity available, unit size, unit weight
* A service provider can browse the site and view all available supplies
* They can add one or more supplies to their cart
* During checkout they can request delivery and set their current location using GPS coordinates.
* The suppliers are notifed that a new request has come in

Disaster areas probably don't have desktops, electricity, and internet
access. This project was built targeting *mobile web* where
appropriate.

####Important note

There is currently a PostgreSQL encoding error raised when seeding the database using Ruby 2.2.0. To rectify this, switch to Ruby 2.1.*.

##Getting Started

- Clone this repository.
- Once in the project directory, run <code> bundle install </code>
