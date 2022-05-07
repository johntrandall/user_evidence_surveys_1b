##!/bin/bash

# This is a script to quickly spin-up a Rails Project and push it to Heroku.
# Great for Hackathons and Rails-centric code challenges!
# author: John Randall
# https://gist.github.com/johntrandall/a33c7d4c880fcef2a6dc0258abec92fe


echo Hello World!

project_name=$1
echo Name is $project_name


echo "\n\n\n\n*********************************"
echo "update Brew"
brew update


echo "\n\n\n\n*********************************"
echo "update git"
brew install git
brew upgrade git
# git config --global init.defaultBranch main


echo "\n\n\n\n*********************************"
echo "Creating new Rails Project"
rails new $project_name --database=postgresql --v='6' --css=bootstrap --skip-test
cd $project_name
git add .
git commit -m "Rails New"

echo "\n\n\n\n*********************************"
echo "bundling rails"
bundle

echo "\n\n\n\n*********************************"
echo "Creating Database"
rails db:create
git add .
git commit -m "create database"

echo "\n\n\n\n*********************************"
echo "Adding Rspec"
echo 'gem "rspec-rails", group: [:development, :test]' >> Gemfile
bundle
rails g rspec:install
git add .
rspec
git commit -m "install rspec"

echo "\n\n\n\n*********************************"
echo "Adding Annotate"
echo 'gem "annotate", group: [:development]' >> Gemfile
bundle
rails g annotate:install # automatically annotate every time you run db:migrate
git add .
git commit -m "install annotate"

echo "\n\n\n\n*********************************"
echo "Adding Factory Bot"
echo 'gem "factory_bot_rails", group: [:development, :test]' >> Gemfile
bundle
git add .
git commit -m "install factory_bot_rails"


echo "\n\n\n\n*********************************"
echo "adding x86_64-linux platform for Heroku"
bundle lock --add-platform x86_64-linux
git add .
git commit -m "Add platform x86_64-linux for Heroku"

echo "\n\n\n\n*********************************"
echo "adding Procefile for Heroku"
touch ./Procfile
echo "release: bundle exec rails db:migrate" >> ./Procfile
echo "web: bundle exec rails server -p \$PORT" >> ./Procfile
#echo "worker:  bundle exec rails jobs:work" >> ./Procfile
git add .
git commit -m "Add Procfile for Heroku"

#echo "\n\n\n\n*********************************"
#echo "Adding .nvmrc to control Node version"
## this may not be needed - was part of Semephore workaround
#touch ./nvmrc
#echo "12.16.2" >> ./nvmrc
#git add .
#git commit -m "Add .nvmrc to control Node Version"


echo "\n\n\n\n*********************************"
# see https://devcenter.heroku.com/articles/bundler-version
# see https://devcenter.heroku.com/changelog
heroku_bundler_version="2.3.10"
echo "seting Bundler version to match Heroku:" $heroku_bundler_version
mkdir ./.bundle
touch ./.bundle/config
echo "---" >> ./.bundle/config
echo "BUNDLE_DEFAULT: \"$heroku_bundler_version\"" >> ./.bundle/config

# remove bundler from gitignore
# not recomended by Heroku but might be a good idea as long as you don't URL override
# see https://devcenter.heroku.com/articles/bundler-configuration

sed -i '' '/.bundle/d' .gitignore
git add .
git commit -m "Pin bundler version"


echo "\n\n\n\n*********************************"
echo "set up on Heroku"
#brew install heroku
brew upgrade heroku/brew/heroku
heroku update

heroku_name=${project_name//_/-} # replace _ with -
heroku_name=${project_name:0:30} # truncate to 30 chars
heroku apps $heroku_name

git push --set-upstream heroku main
heroku open


echo "\n\n\n\n*********************************"
echo "set up on Github"
#brew install hub
hub create
git push --set-upstream origin main
hub browse



echo "\n\n\n\n*********************************"
echo "adding JetBrains to .gitignore"
jetbrains_ignore_text="

# Covers JetBrains IDEs: IntelliJ, RubyMine, PhpStorm, AppCode, PyCharm, CLion, Android Studio, WebStorm and Rider
# Reference: https://intellij-support.jetbrains.com/hc/en-us/articles/206544839

# User-specific stuff
.idea/**/workspace.xml
.idea/**/tasks.xml
.idea/**/usage.statistics.xml
.idea/**/dictionaries
.idea/**/shelf

# AWS User-specific
.idea/**/aws.xml

# Generated files
.idea/**/contentModel.xml

# Sensitive or high-churn files
.idea/**/dataSources/
.idea/**/dataSources.ids
.idea/**/dataSources.local.xml
.idea/**/sqlDataSources.xml
.idea/**/dynamic.xml
.idea/**/uiDesigner.xml
.idea/**/dbnavigator.xml

# Gradle
.idea/**/gradle.xml
.idea/**/libraries

# Gradle and Maven with auto-import
# When using Gradle or Maven with auto-import, you should exclude module files,
# since they will be recreated, and may cause churn.  Uncomment if using
# auto-import.
# .idea/artifacts
# .idea/compiler.xml
# .idea/jarRepositories.xml
# .idea/modules.xml
# .idea/*.iml
# .idea/modules
# *.iml
# *.ipr

# CMake
cmake-build-*/

# Mongo Explorer plugin
.idea/**/mongoSettings.xml

# File-based project format
*.iws

# IntelliJ
out/

# mpeltonen/sbt-idea plugin
.idea_modules/

# JIRA plugin
atlassian-ide-plugin.xml

# Cursive Clojure plugin
.idea/replstate.xml

# SonarLint plugin
.idea/sonarlint/

# Crashlytics plugin (for Android Studio and IntelliJ)
com_crashlytics_export_strings.xml
crashlytics.properties
crashlytics-build.properties
fabric.properties

# Editor-based Rest Client
.idea/httpRequests

# Android studio 3.1+ serialized cache file
.idea/caches/build_file_checksums.ser
"

echo "$jetbrains_ignore_text" >> .gitignore
git add .
git commit -m ".gitignore Jetbrains"



echo "\n\n\n\n*********************************"
echo "open RubyMine"
rubymine .


echo "\n\n\n\n*********************************"
echo "local dev"

#rails s
#open http://127.0.0.1:3000

heroku local
open http://127.0.0.1:5000
