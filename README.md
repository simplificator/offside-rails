# README

## Action Cable on Heroku 

### Setup

Manual: https://blog.heroku.com/real_time_rails_implementing_websockets_in_rails_5_with_action_cable

```shell
> heroku addons:add redistogo
Creating redistogo on ⬢ offside-rails... free
Created redistogo-perpendicular-19308 as REDISTOGO_URL
Use heroku addons:docs redistogo to view documentation

> heroku config --app offside-rails | grep REDISTOGO_URL
REDISTOGO_URL:            redis://redistogo:a2d8f053ac05e7b0b2fcb288eb382b34@porgy.redistogo.com:9379/
```

Put `REDISTOGO_URL` to `./config/cable.yml`, like so:

```yml
# ...
production:
  adapter: redis
  url: redis://redistogo:a2d8f053ac05e7b0b2fcb288eb382b34@porgy.redistogo.com:9379/
```

Make configurations in `./config/environments/production.rb`

```ruby
  config.web_socket_server_url = "wss://offside-rails.herokuapp.com/cable"
  config.action_cable.allowed_request_origins = ['https://offside-rails.herokuapp.com', 'http://offside-rails.herokuapp.com']
```
