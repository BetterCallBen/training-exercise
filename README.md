## Setup

### Import repository

Follow [this link](https://github.com/new/import) to create a new repository from an existing one \
Fill the old repository with this url https://github.com/BetterCallBen/training-exercise.git \
Choose your repository name and begin import

### Clone the repository

Once it's done, copy your SSH address and clone the repository on your computer:

```sh
cd ~/code/YOUR_GITHUB_USERNAME
git clone YOUR_SSH_ADDRESS tree-adoption
cd tree-adoption
```

### Install dependencies using Bundler and Yarn:

```sh
bundle && yarn
```

### Initialize the database

```sh
rails db:create db:migrate
```

### Start coding 

```sh
code . && dev
```

### To run specs

Notice that it won't work until you generate the good models and controllers

#### All specs

```sh
bundle exec rspec
```

#### Specific specs (tree model exemple)

```sh
bundle exec rspec spec/models/tree_spec.rb 
```

## Config 

### Ruby

This app is using ruby 3.1.2

#### To install it 

```sh
rbenv install 3.1.2
```

#### To set the default version

```sh
rbenv global 3.1.2
```
### Rails

This app is using ruby 7.0.4

#### To install this rails version

```sh
gem install rails -v 7.0.4
```

#### To set the last rails version

```sh
rbenv rehash
```

