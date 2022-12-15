## Setup

### Import repository

Go and create a new [repository](https://github.com/new/import) from an existing one\
Fill the old repository with this url https://github.com/BetterCallBen/training-exercise.git\
Choose your repository name

### Clone the repository

Once it's done, clone the repository on your computer:

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
rake db:create db:migrate
```

### Start coding 

```sh
code . && dev
```
