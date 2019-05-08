# README

## Better Reads API
Better Reads is my web application that allows my friends to easily view my library. It uses the Goodreads API as the data source. The Goodreads API has a few issues that make it undesirable to connect to it directly from the web application, and necessitate this intermediary API layer: no CORs, and XML responses (which were frustratingly ugly for me to parse in JS).

### To Run
This is a bog-standard Rails app created from the Rails generator, nothing special to see here! As such to run locally, simply use
`rails s`

### Why No Tests?
Wait, aren't you RSpec's biggest fan? Maybe, but... the XML response is so crufty I didn't really relish the opportunity to mock it out yet. There's also not a lot going on in this API yet beyond the http request so there's not a huge amount of logic to test. Manual testing on the front end will suffice for now.
