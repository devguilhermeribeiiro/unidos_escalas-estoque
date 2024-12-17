# Use the official Ruby image as the base image
FROM ruby:3.2

# Set the working directory in the container
WORKDIR /app

# Install system dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs npm

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install Ruby dependencies (gems)
RUN bundle install

# Copy the package.json and package-lock.json into the container
COPY package.json package-lock.json ./

# Install Node.js dependencies
RUN npm install

# Copy the entire application into the container
COPY . .

# Build the Tailwind CSS styles
RUN npm run build:css

# Expose the port the app runs on
EXPOSE 4567

# Define the command to run the app
CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "--port", "4567"]

