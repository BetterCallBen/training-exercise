## Setup

### Import repository

Go and create a new [repository](https://github.com/new/import) from an existing one \
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

```sh
bundle exec rspec
```

