# ZencoderWrapper

Simple Zencoder wrapper to test the service.

## Installation

`bundle install`

## Usage

Just edit the test.rb file:

``` ruby
video = Video.new(
  token:   'sublime_720',
  path:    'http://media.jilion.com/videos/demo/midnight_sun_sv1_720p.mp4',
)
```

and run the test file: `ruby test.rb`.

Outputs can be edited in `config/zencoder_job_request.yml`

------------
Copyright (c) 2010 - 2012 Jilion(r)