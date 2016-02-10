# SwaggerEngine

Include [swagger-ui](https://github.com/swagger-api/swagger-ui) as rails engine.

## Swagger specifications

https://github.com/swagger-api/swagger-spec/blob/master/versions/2.0.md

## Install

Add to Gemfile

```gem 'swagger_engine'```

Add to your config/routes.rb

```mount SwaggerEngine::Engine, at: "/api-docs"```

### Protect your route

#### Devise

```
authenticate :user do
  mount SwaggerEngine::Engine, at: "/api-docs"
end
```

or

```
authenticate :user, lambda { |u| u.admin? } do
  mount SwaggerEngine::Engine, at: "/api-docs"
end
```

#### Basic http auth

Set username and password in `config/initializers/swagger_engine.rb`:

```
SwaggerEngine.configure do |config|
  config.admin_username = ENV['ADMIN_USERNAME']
  config.admin_password = ENV['ADMIN_PASSWORD']
end
```

## Configure

### Json files

Set the path of your json files in a initializer:

```
#config/initializers/swagger_engine.rb

SwaggerEngine.configure do |config|
  config.json_files = {
    v1: "lib/swagger/swagger_v1.json",
    v2: "lib/swagger/swagger_v2.json"
  }
end
```
`lib/swagger/` is a good place to place them..

### Edit your json files

Use [Swagger editor](https://github.com/swagger-api/swagger-editor).

## Contributing

### How to update swagger-ui
Most of the files in `swagger-ui/dist/` now live in `app/assets` and `app/views`. A few changes have been made to accomodate the Rails asset pipeline:

* Styles need `url()` to be changed to `image-url()` or `font-url()` in order to receive the correct path under the Rails asset pipeline.

* `index.html` has been renamed to `index.html.erb` and modified to use the Rails asset pipeline. Stylesheets and Javascript has been combined under `application.js` and `application.scss`.

## License

This project rocks and uses MIT-LICENSE.

## Developed in collaboration with

[Rawfish](http://rawfishindustries.com)

[![Rawfish Logo](http://rawfishindustries.com/wp-content/uploads/2015/03/logo_rawfish_WEB.jpg)](http://rawfishindustries.com)
