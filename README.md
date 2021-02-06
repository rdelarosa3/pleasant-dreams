
<b></b>
<b></b>
<p align="center"> 
Pleasant Dreams is a Full Stack Ruby Web app built on Rails Framework. This app allows users to book appointments through a custom booking system, admin dashboard and email response.
</p>

## Table of Contents
1. [Demo](https://github.com/rdelarosa3/pleasant-dreams#demo)
2. [Technologies Applied](https://github.com/rdelarosa3/pleasant-dreams#technologies)
3. [Setup Instruction](https://github.com/rdelarosa3/pleasant-dreams#setup-instruction)
4. [Contribution](https://github.com/rdelarosa3/pleasant-dreams#contribution)
### Demo
[pleasantdreams.herokuapp.com](https://pleasantdreams.herokuapp.com/)
                        
### Technologies
- Oauth2 [link](https://oauth.net/2/)
- AWS S3 [link](https://aws.amazon.com/s3/)
- Bootstrap [link](https://getbootstrap.com/)
- jQuery [link](https://jquery.com/)
- Rails 5.2 
- Ruby
- Active Record
- PostgreSQL
- Heroku
- Clearance [link](https://thoughtbot.com/upcase/videos/clearance-rails-authentication-made-easy)


### Setup Instruction

<p>Prerequisites

The setups steps expect following tools installed on the system.

- Ruby 2.6.6
- Rails 5.2
- AWS S3 bucket and credentials

<p>1. Check out the repository </p>

```bash
git clone git@github.com:rdelarosa3/rovix.git
```

<p>2. Create database.yml file </p>

Copy the sample database.yml file and edit the database configuration as required.

```bash
cp config/database.yml.sample config/database.yml
```

<p>3. Create and setup the database </p>

Run the following commands to create and setup the database.

```ruby
bundle exec rake db:create
bundle exec rake db:setup
```

<p>4. Start the Rails server </p>

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```

And now you can visit the site with the URL http://localhost:3000

### Contribution
**This list is in alphabetical order**

<details>
  <summary>Robert De laRosa <a href="https://github.com/rdelarosa3" target="_blank">GitHub</a></summary>

  1. Implementation of Clearance for Security 
  2. Integration of AWS S3 for remote file storage
  3. Implementation and setup for Oauth2
  4. UX/UI design using JS, CSS, JQuery, and Bootstrap libraries
</details>
