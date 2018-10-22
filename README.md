# Airmagedon

Web application presenting data from airly sensors in an accessible graphic forms

![Graph graphic ](https://raw.githubusercontent.com/RubyHuntsman/airmagedon/master/public/git_img.png)

Below a link to the company with which it provides its api from which the data originates
https://airly.eu/

### Stack
* [Ruby on Rails]  
* [PostgreSQL]
* [JavaScript (Vanilla)]
* [Sass (scss)] 
* [Chart.js]
* [Bootstrap] 

### Installation
To install the application follow the instructions below

Create psql user with database

```sh
$ su - postgres
$ create role airmagedon with createdb login password 'airmagedon';
$ \q
```

Before installing, make sure that you have the correct language version
- Ruby 2.5.1
- Rails 5.2.1


```sh
$ git clone git@github.com:RubyHuntsman/airmagedon.git
$ cd airmagedon/
$ bundle
$ rails db:migrate
$ rails s
```
Now you can go to the website 
http://localhost:3000/

### Pre setup user
| User | Password |
| ------ | ------ |
| admin | aezakmi |
| user | user |


### Todos
 - Add SMS alerts
 - Collecting a large amount of measurement data
 - Write unit tests
 - Progressive web app
 - Add night mode

  [Ruby on Rails]: <https://rubyonrails.org/>
  [PostgreSQL]: <https://www.postgresql.org/>
  [jQuery]: <http://jquery.com>
  [JavaScript (Vanilla)]: <https://www.javascript.com/>
  [Sass (scss)]: <https://sass-lang.com/>
  [Chart.js]: <https://www.chartjs.org/>
  [Bootstrap]: <https://getbootstrap.com/>
