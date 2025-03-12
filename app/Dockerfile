# Use an official Node.js image (Alpine is lightweight)
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json first (for efficient caching)
COPY package.json .

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Expose port 3000 to access the app
EXPOSE 3000

# Start the server
CMD ["node", "server.js"]

