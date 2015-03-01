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
- Once in the project directory, run the following commands in the command line:
   bundle install
   rake db:setup
This will take a moment; be patient! Rails is seeding the database. Once the database has been seeded, run:
   rails server

Airlift should now be viewable. In your browser, visit http://localhost:3000 . This is the default port. If you don't see the Airlift app, please check your command line. A couple of lines after you typed <code>rails server</code>, a line like this should have appeared:

   => Rails 4.1.7 application starting in development on http://0.0.0.0:3000

If the last number (the port number) is not 3000, you can still view the Airlift app by visiting http://localhost:[your port number]. 

If you can see the app now, feel free to poke around. Try logging in as some sample users:

Username: demo+rachel@jumpstartlab.com
Password: password

Username: demo+josh@jumpstartlab.com
Password: password

###Running Tests

In order to run the test suite, run <code>rspec</code> in the command line.
