# Stage 1: Build environment
FROM ruby:3.2.2 as builder

# Set the working directory in the container
WORKDIR /app

# Set production mode
ENV RAILS_ENV production

# Fetch RAILS_MASTER_KEY from GitHub secret
ARG RAILS_MASTER_KEY
ENV RAILS_MASTER_KEY=$RAILS_MASTER_KEY

# Install dependencies required to build gems
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Copy the Gemfile and Gemfile.lock to the container
COPY Gemfile Gemfile.lock ./

# Install dependencies
RUN bundle install --without development test

# Copy the rest of the application code to the container
COPY . .

# Precompile assets
RUN rake assets:precompile

# Stage 2: Production environment
FROM ruby:3.2.2-slim

# Set the working directory in the container
WORKDIR /app

# Set production mode
ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_LOG_TO_STDOUT true

# Fetch RAILS_MASTER_KEY from GitHub secret
ARG RAILS_MASTER_KEY
ENV RAILS_MASTER_KEY=$RAILS_MASTER_KEY

# Copy Ruby and application relevant files from build stage
COPY --from=builder /usr/local/bundle /usr/local/bundle
COPY --from=builder /app /app

# Copy the entrypoint script into the container
COPY entrypoint.sh /usr/local/bin/

# Set the entrypoint
ENTRYPOINT ["entrypoint.sh"]

# Expose the port that the Rails application will run on
EXPOSE 3000

# Start the Rails application
CMD ["rails", "server", "-b", "0.0.0.0"]
