# A plant care Ruby on Rails app 🍃
## Designed and developed as the final project for the Le Wagon Full-Stack Development Bootcamp from a team of 3 amazing women in 2 weeks

### Where is it hosted currently?
    https://www.green-thumb.me/

### For which screens is it developed?
Currently only for small screens (mobile)

### How does it work?
Visit the page and create an account. You can explore the interface and find out more about the features of the app:
* A dashboard with all your plants
* Each of them can be viewed in more detail, with watering, fertilizing and sun exposure information as well as an option to upload a photo (Cloudinary)
* The better care you take of your plant, the happier it is (happiness algorithm based on watering, fertilizing, care level and actual sun exposure)
* A list of all the tasks you need to do today, with mark as done feature
* A feature to add a new plant to your collection (using Perenual API)
* A calendar to keep track of all the past and upcoming care tasks (using Simple Calendar gem)
* An AI helper to ask more specific plant questions (using OpenAI API)

## For developers
### Requirements
Make sure you have:
* Ruby v3.1.2 (can be checked with ```ruby -v```)
* [Ruby on Rails](https://guides.rubyonrails.org/getting_started.html) v7.1.3 (can be checked with ```rails -v```)

### API keys and access tokens
Create a ```.env``` file in the root directory for your:
* PERENUAL_KEY (https://perenual.com/)
* CLOUDINARY_URL (https://cloudinary.com/)
* OPENAI_ACCESS_TOKEN (https://platform.openai.com/)

Copy in the ```.env``` file the following, replacing the square brackets and their content, with your keys and access token:
```
PERENUAL_KEY=[example_key]
CLOUDINARY_URL=[example_url]
OPENAI_ACCESS_TOKEN=[example_access_token]
```
### Configure PostgreSQL
Run on the command line:
```
sudo apt install -y postgresql postgresql-contrib libpq-dev build-essential
```
```
sudo -u postgres psql --command "CREATE ROLE \"`whoami`\" LOGIN createdb superuser;"
```

### Ruby gems
From the root folder, run on the command line:
```
bundle install
```

### Database
Create a new database:
```
rails db:create
```
Apply all pending migrations to the database:
```
rails db:migrate
```
Populate the database with the initial data (optional):
```
rails db:seed
```

### Run the app on a local server
Run on the command line:
```
rails s
```
Visit localhost:3000 with your web browser.
