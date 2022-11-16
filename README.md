
# Markdown to HTML parser

Summary:

- [Introduction](#introduction)
- [Installation](#installation)
- [Run tests](#how-to-run-tests-locally)
- [Test from postman](#testing)

## Introduction

This project is a simple Markdown to HTML parser


## Installation

    - Install rails locally
    - `bundle install` should install all the gems locally
    - Run `bin/rails s` from project root directory
    - Rails server should start on 3001 port. Change the port if 3001 is already being used.


## How to run rspec locally 

    - Run `bundle exec rspec` to run all tests

## Test from postman

    - Run a POST request from postman with the following request details 

        - URL `http://127.0.0.1:3001/parse`
        - BODY as the plain text (string needed to be parsed)

## Parser Location

    - lib/markdown_parser
