
# Planet Marketplace

### Explain the different high-level components (abstractions) in your App - explain and show understanding
 - How different parts of the site work in relevant chunks
 - 
 - this could very well be done by the rest of the documentation
 - MVC Model
 - Users, Profiles & Assets
  - User Messages
 - Listings, Transactions
 - Reviews, Ratings
- Planets
 - Planet Claiming
 - Planet Resource Acquisition

## Detail any third party services that your App will use
##### Amazon S3 of the Amazon Web Services
- used as an image upload service

##### Devise gem for rails authentication
- using the devise gem to validate and authenticate all interaction with a profile and listings a user has made

### Identify the problem you’re trying to solve by building this particular marketplace App? Why is it a problem that needs solving?
- It's a fictional marketplace that demonstrates an understanding of how marketplaces are structured, in particular this is not so much a problem but a fun application used for amusement as it is about fictional characters trading and selling planets and is incredibly unrealistic.
- It does need solving!
- Problems associated include:
 - Remaining on task (keeping things simple to begin with), planning thoroughly, updating consistently
 - Adapting concepts as unforeseen problems become apparent (adjust ERD, adjust goals on trello, adjust site map)


##### 


### User Stories - provide user stories for your app, cover most of the needs of the app

##### US 1 - A User wants to sell a planet (user wants to do 'action' because 'reason')
- demonstrates how a user can create a new listing
- click the new listing button
- fill in listing title and description
- select from one or more planets that they own what they want to list
- set a price
- publish the listings
- another users purchases the listing
- selling user receives credits they set in the price minus a selling fee
- buyer receives planets and seller has planets removed

##### US 2 - A User wants to buy a planet
- user searches for the type of planet they want, by specifying budget and what they're looking for
- finds a listing
- buys listing
- receives planets

##### US 3 - A User wants to review a planet they bought
- Have an option to leave reviews based on past reviews
- There is a prompt in a users profile to leave a review
- They can then see the review rating reflect on the other users rating and see their review on their page
- The other user then replies to their rating, giving a thumbs up or thumbs down, saying they did not deserve the rating

##### US 4 - User wants to purchase and collect on investment
- user sets up facilities to acquire resources from their planets over a period of time

##### US 5 - User wants to claim a planet
- buy an army or requisition an army using credits over a period of time
- use that army to conquer an 'unclaimed' planet
- each invasion/purge takes a certain amount of time
- users claims new planet
- user then reinforces that same army with the new planets population
- user then uses that army to conquer another users planet
- there is a period of time in which the other user can send an army to fend off the attack
- armies to damage to each other, one wins and the other army is wiped out, there is damage done to the planet too




### Entity Relationship Diagram - Simple/Core Elements
I created a more complex ERD (which I've included below this one) as I was coming up with the idea for the application, however as time proceeded I realised I needed to simplify my goals for the purpose of time management and the assessment so this 'simple' ERD resembles the project as it currently stands.
![Planet Marketplace - Simple Entity Relationship Diagram](docs/ERD_simple.jpg)

### Core Database Relations
Discuss the database relations to be implemented.
Describe your project’s model in terms of the relationships (active record associations) they have with each other.

##### Users to Profiles
- Each user has a profile that is belongs to it by a foreign key in profile.
- a profile record cannot exist without a user record

##### Users to Users
- users interact with each other via messages and reviews

##### Listings to Users
- users buy and sell to other users listings

##### Planets to Listings
- listings contain planets



### Entity Relationship Diagram - Advanced/Stretch Elements
Where I would like the project to go given a larger timeframe. e.g. stretch goals
![Planet Marketplace - Preferred Entity Relationship Diagram](docs/ERD_advanced.jpg)

##### Listings to Carts

- listings can be found in multiple users carts at any one time
- listings are deleted from another users cart if it reaches checkout

##### Listings to Reviews


##### Reviews to Users



### Site Map

![Planet Marketplace - Preferred Entity Relationship Diagram](docs/ERD_advanced.jpg)