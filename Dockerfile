FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy dependency files first for caching
COPY package.json package-lock.json ./
RUN npm install

# Copy rest of the app
COPY . .

# Build the React app
RUN npm run build

# Install serve globally to serve the build
RUN npm install -g serve

# Expose port 5000
EXPOSE 5000

# Run serve in production mode on port 5000
CMD ["serve", "-s", "build", "-l", "5000"]
