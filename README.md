![Build Status](https://codeship.com/projects/09dac760-2f13-0134-69d4-5ebc8f268022/status?branch=master)
![Code Climate](https://codeclimate.com/github/kbedell/gameshelf.png)
![Coverage Status](https://coveralls.io/repos/kbedell/gameshelf/badge.png)

# Gameshelf
## Heroku Link
[Heroku Link](https://quiet-refuge-93160.herokuapp.com/users/sign_in)

## Amazon Alexa Skill
[Amazon Alexa Skill on GitHub](https://github.com/kbedell/gameshelf-alexaskill)

## Description
Gameshelf is a Rails-based web application that allows users to receive back a random game based upon a list of games that they own, and the number of players they have. This application also has the ability to utilize a custom Amazon Alexa Skill (linked above), to allow users to use the Amazon Echo to ask for a random game.

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
8. Run `rails s` in the terminal

## Contributions
If you liked this app enough to want to contribute, thank you! Please create a new branch, and issue a pull request. Please try to have tests for your code. If I the changes look good, then I will merge in the request.
