# Lunch and Learn

## Table of Contents
- [Project Links](#project-links)
- [System Dependencies](#system-dependencies)
- [Testing Dependencies](#testing-dependencies)
- [Installation Instructions](#installation-instructions)
- [Application Architecture](#application-architecture)
- [Summary of Work](#summary-of-work)
- [EncounterSim Screenshots](#encountersim-screenshots)
- [Contributors](#contributors)</br>

<h3 align="center">Project Description</h3>
<p align="center">
Lunch and Learn is an back end application to search for cuisines by country, and provide opportunitty to learn more about that country and culture. Users are able to search for recipes by country, favorite recipes and learn more about a specific country.
</p></br>

## Project Links
- GitHub Repositories
    - [Backend](https://github.com/kbug819/Lunch-and-Learn)

## System Dependencies
- Faraday
- BCrypt
- Ruby (3.2.2) 
- Rails (7.1.1)
API's 
- Edamamm API - Register for an API key [Here](https://developer.edamam.com/edamam-recipe-api)
- REST Countries API *no API key needed*
- YouTube API - Register for an API key [Here](https://developers.google.com/youtube/v3/getting-started)
  - This project uses [Mr. History YouTube Channel](https://www.youtube.com/channel/UCluQ5yInbeAkkeCndNnUhpw)
- Unsplash API - Register for an API key [Here](https://unsplash.com/developers)

## Testing Dependencies
  - Pry
  - Rspec
  - Simplecov
  - Capybara
  - VCR
  - Webmock
  - Postman

## Installation Instructions
 - Fork Repository
 - `git clone <repo_name>`
 - `cd <repo_name>`
 - `bundle install`   
 - `rails db:{drop,create,migrate,seed}`
 - `rails s`
 - Postman also used for live testing

## Application Architecture
- This application uses a service oriented architecture.
    - Application was made to work with a seperate front-end application. The application was build to satisfy wire frames from a Front-end team, but handles all logic and database for the application as a whole.

## Summary of Work / API Endpoints
<u>GET /api/v1/recipes?country=thailand</u>
  - Find recipes from a specific country by aggregating data from two external APIs
    - Utilizing two APIs (REST Country, Edamam), application searches for recipes from a specific country.
    - If user does not pass in a country, application will choose a random country and search by that country.
    - Rest Country API is also used to verify that search keyword is a valid country before performing search.<br>

<u>GET /api/v1/learning_resources?country=laos</u>
  - Provides an educational video and images of a searched country
    - Endpoint uses YouTube API to find videos for a specific country using Mr. History YouTube Channel
    - Performs a general image search for keyword using Unsplash

<u>POST /api/v1/users</u>
  - Using basic authentication, user can register for an account
    - Application will verify email is unique, passwords match and will create a User.
    - After User is created, they will receive an API key to utilize, all information is sent back to the front-end application

<u>POST /api/v1/sessions</u>
  - Using basic authentication, user can log in to their account
    - Application will verify email and password are accurate and will return the user's assigned API key

<u>POST /api/v1/favorites</u>
  - User can favorite recipes and save those recipes to their account
    - Application verifies API key and saves favorite data in database.

<u>GET /api/v1/favorites?api_key=DEMO KEY</u>
  - User can retrieve their favorited recipes
    - Application verifies API key and returns a list of client's favorites in database

## Project Goals
- Expose an API that aggregates data from multiple external APIs
- Expose an API that requires an authentication token
- Implement Basic Authentication
- Expose an API for CRUD functionality
- Determine completion based on needs of the front-end team
- Test both API consumption and exposurre, making use of mocking tools (VCR, Webmock)


## Contributors
- Kaylee Janes [GitHub](https://github.com/kbug819) | [LinkedIn](https://www.linkedin.com/in/kaylee-janes/)

