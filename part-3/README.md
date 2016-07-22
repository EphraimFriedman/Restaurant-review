# Part 3: Build a CRUD App

## Summary

In Part 3 of the assessment, you'll build a web-stack application: controllers, views, user authentication, database migrations, model validations, associations, etc.  This is an opportunity to demonstrate your proficiency in the core skills from Phase 2.


### Completing Part 3
Part 3 is the final part of the Phase 2 assessment.  If Parts 1 and 2 are finished, devote the rest of the day to completing as much of this application as possible.  The time allocated for the assessment might end before you've finished all the releases. If time is running out, continue to complete the releases in order and make as much progress as you can.  Use your time wisely:  if you're stuck,  ask questions and get help.


### Web Application Overview
You'll be building a simplified version of a restaurant review site—a much simplified version of Yelp.  Users will be able to register with the site, add restaurants to the site, and provide reviews for restaurants.  We'll build the site one feature at a time.  The requirements for each feature are described in more detail in the *Releases* section.


## Releases
The releases describe features to build out in your web application.  Each release will describe what to build, not how to build it.  Apply best practices.  For example, the releases contain mockups of the application.  In the mockups, the URLs are omitted from the browser's address bar.  You should determine the appropriate path for each page based on the conventions / patterns you've learned in Phase 2.


### Pre-release: Setup
Make sure that everything is set up before we begin working on the application: install any necessary gems and create the database.  From the command line, navigate to the `part-3` directory of the Phase 2 assessment.  Once there, run ...

0. `$ bundle`
0. `$ bundle exec rake db:create`


### Release 0: User Registration
The first feature to build is user registration, which allows users to create new accounts.  What are best practices for user registration?  What routes do you need?  How can you keep user data safe?

On the homepage, add a "register" link.  Clicking the link takes the user to a page with a form for creating a new account.  Users must register with an e-mail address, a username, and a password.  The e-mail address and username must be unique.

If registration is unsuccessful, the user should see the registration form and the associated error messages.  If registration is successful, the user should be considered logged in and redirected to the homepage where the "register" link is replaced with the user's username.  This is demonstrated in Figure 1.

![registration mockup](readme-assets/registration.gif)  
*Figure 1*. Registering unsuccessfully and then successfully.


### Release 1: Login/Logout
Now that users can register, allow them to login and logout.  On the homepage, add a "login" link next to the "register" link.  Clicking the link takes the user to a page with a form for logging in.  Users sign in with an e-mail address and password.

If login is unsuccessful, the user should see the login form and an error message.  If login is successful, the user should be considered logged in and redirected to the homepage where the "login" and "register" links are replaced with the user's username and a "logout" link.

Clicking the "logout" link logs the user out and redirects the user back to the homepage.  These behaviors are demonstrated in Figure 2.

![login/logout animation](readme-assets/login-logout.gif)  
*Figure 2*. Logging in unsuccessfully, logging in successfully, and logging out.


### Release 2:  Adding Restaurants
Add a feature that allows registered users to add restaurants to the site.  Logged-in users should see an "Add a Restaurant" button on the homepage.  Clicking the button takes the user to a form.  The form should collect data like the restaurant's name, the restaurant's location, and the type of cuisine served.

When the form is submitted, if adding the restaurant is unsuccessful (e.g., failing a validation), the user should see the form and the associated error messages.  If listing the item is successful, the user should be redirected to a page showing the restaurant's details.  Each restaurant should be associated with the user who added the restaurant.  This is demonstrated in Figure 3.

![add restaurant animation](readme-assets/add-restaurant.gif)  
*Figure 3*.  Adding a restaurant unsuccessfully and then successfully.


### Release 3:  Browsing Restaurants
Add a feature that lists restaurants.  Restaurants should be listed on the homepage for any visitor to browse.  Each restaurant's name, city, and state should be displayed.  The name should be a link.  Clicking the link takes the user to a page showing the restaurant's details.  This is demonstrated in Figure 4.

![browse restaurant animation](readme-assets/browse-restaurants.gif)  
*Figure 4*. Browsing restaurants and viewing a specific restaurant.


### Release 4:  Editing a Restaurant's Details
Allow users to edit restaurant details.  In the list of restaurants on the homepage, if a user is logged in, the user should see an "edit" link for any restaurants the user added.  Clicking the link takes the user to a form for editing the restaurant.  The form should be populated with the restaurant's current details.  Submitting the form makes a request to update the restaurant.

If the update is unsuccessful, the user should see the form and the associated error messages.  If updating the restaurant is successful, the user should be redirected to a page showing the restaurant's details.  The successful outcome is demonstrated in Figure 5. 

![editing a restaurant](readme-assets/edit-restaurant.gif)  
*Figure 5*. Successfully editing a restaurant.


### Release 5: Deleting a Restaurant
#### Deleting Restaurants
_Given_
* The registered user is signed in
* The registered user has previously created restaurants

---------

Add a button to delete a restaurant to each restaurant the user created

![](mockups/home-page-with-delete-restaurant-button.png)

When the user clicks the delete button
  * the restaurant record should be removed from the data store
  * the user should be taken back to the home page
  * the restaurant should no longer appear on the page

![](mockups/home-page-with-restaurant-deleted.png)


###Release 6:  Apply Responsible Behavior Per User and Route

Look back on the work you've done in this release. Use your best judgment (and
be prepared to defend your choices!) about what level of security is
appropriate and implement that in the code.

Ask yourself:

* Must a user be logged in to view all restaurants?
* Should an authenticated user be able to view another user's restaurants?
* Who should be able to delete or create an restaurant? Can anyone? Must you be
  logged in?

Make the appropriate code changes to support a responsible set of interactions.


### Release 7: Review
Knowing that all these restaurants exist is a great start, now let's provide a way for users to add a review.

#### Restaurant Page
_Given_
* There exist previously created restaurants

--------

Update the restaurant listings on the home page by making the name a link

![](mockups/home-page-restaurant-links.png)

When the user clicks on the restaurant name they should be taken to a page with all the details for the restaurant.

![](mockups/restaurant-details.png)

#### Creating a Review
_Given_
* The user is _not_ logged in
* The user is on a restaurant detail page

------
Add a button to the page requiring log in to review

![](mockups/not-logged-in-on-restaurant-page.png)

When the user clicks this button they should be taken to the same page as the login instructions above

![](mockups/login-form.png)

_Given_
* The registered user is signed in
* The user is on a restaurant detail page

-----

Show a form allowing the user to
  * rate a restaurant (1 - 5)
  * provide a body for the review

![](mockups/restaurant-page-with-review-form.png)

When the user submits the form
  * the user should be returned to the restaurant page
  * the user should no longer see the form
  * the user should see a thank you message
  * the thank you message will only be visible when being redirected to the restaurant details page after creating a review

![](mockups/restaurant-page-with-thank-you-message.png)

#### Viewing Restaurant Reviews
_Given_
* The user is on a restaurant detail page

-----

Show all the reviews for a restaurant
  * Only Show the review form if the user has not created a review.

_User reviewed restaurant_
![](mockups/restaurant-page-with-reviews-when-user-has-reviewed.png)

_User has not reviewed restaurant_
![](mockups/restaurant-page-with-reviews-when-user-has-not-reviewed.png)

## Conclusion
Part-3 wraps up the assessment.  If you haven't already done so, commit your
changes.  Please wait until the end of the assessment period to submit your
solution.
