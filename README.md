![Build Status](https://codeship.com/projects/09dac760-2f13-0134-69d4-5ebc8f268022/status?branch=master)
![Code Climate](https://codeclimate.com/github/kbedell/gameshelf.png)
![Coverage Status](https://coveralls.io/repos/kbedell/gameshelf/badge.png)

# Gameshelf
## Heroku Demo Site Link
[Heroku Link](https://quiet-refuge-93160.herokuapp.com/users/sign_in)

## Amazon Alexa Skill
[Amazon Alexa Skill on GitHub](https://github.com/kbedell/gameshelf-alexaskill)

## Description
Gameshelf is a Rails-based web application that allows users to track the board games they own. In addition to its web interface, Gameshelf utilizes a custom Amazon Alexa Skill (linked above) that allows users to ask an Amazon Echo, Tap, or Dot for a random game based on the number of players they have.

## Functionality Breakdown
* Anonymous users can view the site's privacy policy
* Anonymous users can login through the Devise gem, login with Amazon, or sign up
* Authenticated users can enter in how many players they have, and receive a random game from their list
* Authenticated users can search for games, and add them to their list
* Authenticated users can delete games from their list

### Alexa Functionality
* Users can link their Gameshelf (if account was created with Amazon) to the custom Alexa Skill
* Users can say, 'Alexa ask Game Shelf to find a four player game' to receive a random game
* Users can say, 'Alexa open Game Shelf', to start a dialog with Alexa where she will ask users how many players they have before returning a random game.

## Dependencies
This application assumes the following:
* Using Ruby 2.2.3
* Using Rails 4.2.6
* Using Postgres as a database

## Install Instructions
1. Clone the repo down from github: `git@github.com:kbedell/gameshelf.git`
2. Change to the repo directory in your terminal
3. Run `bundle install` in the terminal
4. Run `NPM install` in the terminal
5. Run `rake db:create` in the terminal
6. Run `rake db:migrate` in the terminal
7. Run `NPM start` in the terminal
8. Run `rails s` in a new tab in the terminal

### If you are using your own Login with Amazon Information
1. Navigate to the [Amazon Developer Console](https://developer.amazon.com)
2. Navigate to the Login with Amazon section (Under Apps & Services)
3. Add your site URL to Allowed origins
4. Add your site's callback url (example: `https://YOURSITE.COM/users/auth/amazon/callback`) to allowed return urls

## Contributions
If you liked this app enough to want to contribute, thank you! Please create a new branch, and issue a pull request. Please try to have tests for your code. If I the changes look good, then I will merge in the request.
