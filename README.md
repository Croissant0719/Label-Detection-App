# Label Detection App
When you upload picture, this app outputs labels of it.

![](https://img.shields.io/badge/rails-5.2.1-brightgreen.svg)
![](https://img.shields.io/badge/ruby-2.5.1-green.svg)

## How to Setup
```
$ cd Label-Detection-App
```

```
$ cp config/database.yml.default config/database.yml
```

and add your mysql server password to database.yml,

```
$ echo GCV_API_KEY=[GOOGLE_CLOUD_VISION_API_KEY] > .env

$ bundle install

$ bundle exec rails db:create

$ bundle exec rails db:migrate

$ bundle exec rails s
```
