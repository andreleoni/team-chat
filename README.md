## What is teamChat?

TeamChat is a academyc application like a Slack for send messages between teams. This app was no published.

## [Stack]
- Ruby (on Rails)
- CoffeeScript
- Docker

## I want to contribute

Everyone is welcome to contribute to the project and improve the way people get information about bus traffic.

To contribute follow the steps below:

### 1. Fork this repository
### 2. Clone your fork to a local repository
```
git clone your-foked-repository
cd your-foked-repository
```
### 3. Preparing Ambient
- Rename the file of ambient variables from .env.example to .env.

### 4. Run docker-composer build
```
docker-compose up --build
```
### 5. Run migrations (Os containers terão que estar up para executar o comando abaixo)
```
docker-compose up
docker-compose run --rm app bundle exec rake db:create db:migrate
```
### 6. Run tests
```
docker-compose exec app bundle exec spring rspec
```
### 7. Start the app
```
docker-compose up --build
```
### 8. Add the original repository as a source in your local repository
```
git remote add upstream https://github.com/andreleoni/noPonto
```
### 9. Sync your repository with the original
```
git fetch upstream
```
### 10. Update local repository
```
git checkout master
git merge upstream/master
```
### 11. Create a new branch
```
git checkout -b my-new-feature
```
### 12. Make a pull request
