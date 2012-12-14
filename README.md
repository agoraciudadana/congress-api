# Congress API

Making important decisions available to everyone
  
# Description:

This app is an API for the proposals being voted at the [Spanish Congress](http://congreso.es).

## Use

There is an index and show action for HTML and JSON formats:
    
### HTML

* [http://congress-api.herokuapp.com/proposals](http://congress-api.herokuapp.com/proposals)
* [http://congress-api.herokuapp.com/proposals/1](http://congress-api.herokuapp.com/proposals/1)
    
### JSON

* [http://congress-api.herokuapp.com/proposals.json](http://congress-api.herokuapp.com/proposals.json)
* [http://congress-api.herokuapp.com/proposals/1.json](http://congress-api.herokuapp.com/proposals/1.json)

## Install

    git clone git://github.com/agoraciudadana/congress-api.git
    
    cd congress-api
    
    bundle
    
    rake congress:setup
    
    rails server

You can update the proposals by running:
    
    rake congress:update

## Specs

    rake spec

## Contribute

    1. Find or create an issue
        
    2. Add a comment to the issue to let people know you're going to work on it
        
    3. Fork the repo
        
    4. Hack your changes in a topic branch (don't forget to write some tests ;)
        
    5. Make pull request
        
    6. Wait for comments from maintainers or code merge

## Hackers

    Raimond Garcia

## License:

    Copyright (c) 2012 MIT
