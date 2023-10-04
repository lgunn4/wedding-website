# Use the official Ruby base image
FROM ruby:3.2.2

# Set the working directory in the container
WORKDIR /app

# Set production mode
# ENV SECRET_KEY_BASE 1
# ENV RAILS_ENV production
# ENV RAILS_SERVE_STATIC_FILES true
# ENV RAILS_LOG_TO_STDOUT true

# Copy the Gemfile and Gemfile.lock to the container
COPY Gemfile Gemfile.lock ./
RUN chmod -R 777 ./

# Install dependencies
RUN bundle install

# Copy the rest of the application code to the container
COPY . .

# Create tmp directories
RUN mkdir tmp && mkdir tmp/pids && mkdir tmp/sockets && mkdir tmp/cache
RUN chmod 777 -R tmp

# Precompile assets
RUN rake assets:precompile
RUN rails db:generate
RUN rails db:seed

# Expose the port that the Rails application will run on
EXPOSE 3000

# Start the Rails application
CMD ["rails", "server", "-b", "0.0.0.0"]