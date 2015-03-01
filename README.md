[![Code Climate](https://codeclimate.com/github/Copywright/the_pivot/badges/gpa.svg)](https://codeclimate.com/github/Copywright/the_pivot)

##Airlift

####Live site: http://airlyft.herokuapp.com

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

There is currently a PostgreSQL encoding error raised when seeding the database using Ruby 2.2.0. To rectify this, switch to Ruby 2.1.*. If you are using RVM, this can be acheived by typing <code>rvm use</code>, followed by your preferred pre-2.2.0 version of Ruby, in the command line. For example: <code>rvm use 2.1.5</code>.


##Viewing the site locally

**Warning:** The following will only work if you're willing to create a `.env` file containing your own information for Amazon Web Services' S3 storage service. If not, please visit our live site (the address for which is found at the beginning of this README). If so, clone this repo and create a file called `.env` at the top level of the project directory. The contents of this file should be in the following format:

`S3_BUCKET_NAME=your-bucket-name` <br />
`AWS_ACCESS_KEY_ID=your-access-key` <br />
`AWS_SECRET_ACCESS_KEY=your-secret-access-key`

*Side note: never push this file to GitHub!*

Now, assuming that this information is correct, you can follow these steps to get the app running locally: 

- When in the project directory, run the following commands in the command line:

 `bundle install` <br />
 `rake db:setup`
 
<br />This will take a moment; be patient! Rails is seeding the database. Once the database has been seeded, run:
<br />

 `rails server`

Airlift should now be viewable. In your browser, visit `http://localhost:3000` . This is the default port. If you don't see the Airlift app, please check your command line. A couple of lines after you typed <code>rails server</code>, a line like this should have appeared:

   => Rails 4.1.7 application starting in development on `http://0.0.0.0:3000`

If the last number (the port number) is not 3000, you can still view the Airlift app by visiting http://localhost:[your port number]. 

##Using the App

Try logging in as some sample users:

- Username: `demo+rachel@jumpstartlab.com`
- Password: `password`

- Username: `demo+josh@jumpstartlab.com`
- Password: `password`

Once you're logged in, try shopping and checking out. During checkout, you can use our Google Maps interface to pinpoint an air drop location. 

###Running Tests

In order to run the test suite, 

- clone this repository
- run the following commands in the command line:
 - `bundle install` 
 - `rake db:create`
 - `rake spec`
