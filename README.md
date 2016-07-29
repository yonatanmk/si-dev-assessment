Welcome to the SI Web Dev Assessment
====================================

This repo contains a simple (and incomplete) Ruby on Rails application. For your assessment, you will be updating and implementing functionality within this application. This is an app that will allow users to send sms messages by submitting data into a web form.


Getting up and running
----------------------

You will need to have Git, Ruby, and Ruby on Rails installed on your system. If you haven't done this before, we recommend following the instructions from our friends at RailsBridge:
  * Mac: http://installfest.railsbridge.org/installfest/macintosh
  * Windows: http://installfest.railsbridge.org/installfest/windows
  * Ubuntu: http://installfest.railsbridge.org/installfest/linux

You will want to check that a gem called Bundler is installed:
  `bundler -v`
and if it isn't, install it:
  `gem install bundler`

You will need a GitHub account if you don't already have one:
  https://github.com/join?source=header-home.
Once that is done, view this readme on our GitHub page at:
  https://github.com/StartupInstitute/si-dev-assessment.
and click on the 'Fork' button in the upper right corner. This will create a copy of the repo under your account. To get a local copy on your computer, navigate to a location where you want to keep the source code and then run
  `git clone https://github.com/{your git account here}/si-dev-assessment`
which will download everything into a folder called si-dev-assessment. Navigate into that folder:
  `cd si-dev-assessment`
and then run the following to install any required libraries:
  `bundle install`

Next, run these commands to generate the appropriate databases:
  `rake db:create` and then
  `rake db:migrate`

At this point, you should be able to run the application locally by running
  `rails s`
which you can then view by going to http://localhost:3000 in a browser.


Task 1 - Update the homepage
----------------------------

Upon navigating to http://localhost:3000, you will see a page that simply says
  `Pages#home`
  `Find me in app/views/pages/home.html.erb`
which is not the most welcoming of homepages.  Your first task is to update this page. Give your app a name and add a welcome message. Then update the form on this page to include inputs where your user can type in a message and a number to send it to. You'll probably need a submit button as well. For this task, you can update the view entirely in html or use the rails form helpers (see http://guides.rubyonrails.org/form_helpers.html)

Extra:
Styling this page is important not only for aesthetic reasons, but for usability reasons as well. Go to town!

Before going on, be sure to commit your changes:
  `git commit -a -m "Finishing Task 1"`


Task 2 - Find the error and Debugging
-------------------------------------

Upon submitting your form, you will see an error being thrown. The error message will mention that the sms action of the PagesController is not yet implemented. Find where this error is being raised and remove it. Now you will know where the form submission is processed.

Extra:
It may be helpful at this point to see what data is submitted in the form submission. This application includes the `byebug` gem for this purpose. We can use this by adding the
  `debugger`
statement to set a breakpoint. This sets up a point to interact with the code in the terminal window where you have the server running (where you ran `rails s`). When the code execution reaches this point, an interactive debugging session is opened. Check this for yourself by adding the `debugger` command in the form action and resubmitting the form. Take a look here for more information on how to use `debugger`. In particular, inspect what is passed in as `params` to this action. Before going on, you'll want to remove the breakpoint.

Before going on, be sure to commit your changes:
  `git commit -a -m "Finishing Task 2"`


Task 3 - Submission success
---------------------------

Now when you submit the form, after the submission is processed in the controller, you'll find that the app takes you to a different page. This page should be a submission confirmation page, so update it confirming that the submission worked.

Extra:
It may be more helpful to let the user know exactly what was processed, you may want to display to the user what message they sent, and to which number.

Before going on, be sure to commit your changes:
  `git commit -a -m "Finishing Task 3"`


Task 4 - Install the Twilio library
-----------------------------------

While our app now can successfully post a form submission and return a success page, the actual processing of the form submission doesn't do anything yet. We're going to want to update that to read the submitted data and pass this to an api library from Twilio to send the message. The first step is to install the Twilio Ruby library, which you can read about here:
  https://www.twilio.com/docs/libraries/ruby

One way to install the library locally is to simply run
  `gem install twilio-ruby`
However, this will need to be done every time this application is pulled down. A better way is to list this library in the list of required gems for the application, so that it and all of its dependencies get included in the installation when you run
  `bundle install`
To complete this task, make sure twilio-ruby is added to the required gems. After installing the gem, you will need to restart your server (`CTRL + C`, then `rails s` in your terminal window) before you can use it.

Before going on, be sure to commit your changes:
  `git commit -a -m "Finishing Task 4"`


Task 5 - Create your Twilio account
-----------------------------------

To use the Twilio library, you will need a Twilio account. You can create a free trial account here:
  https://www.twilio.com/try-twilio
As part of creating your account, you will provide a personal phone number which will be verified, and then you will get a Twilio phone number which is the number from which your application will be able to send messages. Your trial account will only let you send messages to verified phone numbers, which is true of your personal phone number. If you want to send messages to another number, you'll have to verify it first.


Task 5 - Sending the SMS
------------------------

We're now ready to process the form submission you created in Task 1 by sending its data to our api library and having it generate the sms message. Take a look at the example code listed on the library page for the syntax of interacting with the library:
  https://www.twilio.com/docs/libraries/ruby
Based on that example, you should be able to substitute in the data you receive from the form submission to use the appropriate message body and to field.

Extra:
While the example code will work, it's a poor practice to include authentication information like your account ID and auth token in your code. A better practice is to set these values as environment variables and have your application read them from the environment. This will make your application more portable and more secure. Read more about this here:
  http://railsapps.github.io/rails-environment-variables.html
Update the code to read the Account Id, Auth Token, and From Phone Number from environment variables, which you can set as Unix environment variables (e.g. `export TWILIO_ACCOUNT_ID=...`)

Before going on, be sure to commit your changes:
  `git commit -a -m "Finishing Task 5"`


App complete! Time to deploy
----------------------------

At this point you should have a working app that allows you to send and sms message to your personal phone number and any other number you've verified with your Twilio account. Congratulations! We can't wait to take a look at the work you've done so far.

Be sure to push your latest code up to your GitHub repo:
  `git push origin`

While it's nice to see your source code, what we'd really like is to see your app running on a server. Heroku makes this easy to do. First test if you have the Heroku CLI installed by running
  `heroku version`.
If you get an error, go to
  https://toolbelt.heroku.com/
and install it. If you don't have a Heroku account, you should go ahead and create one now as well:
  https://signup.heroku.com/login.

Now you can create an app on your Heroku account with `heroku create` and then deploy via `git push heroku master`. When that completes, you should see a message `remote: https://{your Heroku app name}.herokuapp.com/ deployed to Heroku` and you will be able to see your deployed app at `https://{your Heroku app name}.herokuapp.com/`.

More information on deploying your app to Heroku can be found here: https://devcenter.heroku.com/articles/getting-started-with-rails5.

To submit, make sure your latest changes are pushed both to GitHub and Heroku, and send us a link to your repo and to the deployed app.

