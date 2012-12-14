# Congress API

    Making important decisions available to all
    * [Beta site]()
  
# Description:

    This app is an API for the propals being voted at the [Spanish Congress](http://congreso.es).
  
## Install

    git clone git://github.com/agoraciudadana/congress-api.git
    
    cd congress-api
    
    bundle
    
    rake congress:setup
    
    rails server

## Use

    There is an index and show action for HTML and JSON formats:
    
    HTML:
    localhost:3000/proposals
    localhost:3000/proposals/1
    
    JSON:
    localhost:3000/proposals.json
    localhost:3000/proposals/1.json
    
    You can update the current proposals and get news one by running:
    rake congress:update```


## Specs

    rake spec

## Contribute

    1. Find or create an issue
        
    2. Add a comment to the issue to let people know you're going to work on it
        
    3. Fork
        
    4. Hack your changes in a topic branch (don't forget to write some tests ;)
        
    5. Make pull request
        
    6. Wait for comments from maintainers or code merge

## Hackers

    Raimond Garcia

## License:

    Copyright (c) 2012 MIT
