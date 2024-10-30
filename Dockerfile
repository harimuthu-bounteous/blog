# Create a docker file for Ruby on rails project on alpine linux image with the latest version number of ruby
# Use the official image as a parent image
FROM ruby:3.3.5-alpine

# Set the working directory
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
COPY . /usr/src/app

# Install any needed packages specified in requirements.txt
RUN apk add --no-cache build-base postgresql-dev tzdata nodejs yarn

# Install the specific version of bundler required by the Gemfile.lock
RUN gem install bundler:2.5.22

# Install any needed gems
RUN bundle install

# Precompile assets for production
# RUN RAILS_ENV=production bundle exec rake assets:precompile

# Expose port 3000 to the outside world
EXPOSE 3000

# Start the main process
CMD ["rails", "server", "-b", "0.0.0.0"]