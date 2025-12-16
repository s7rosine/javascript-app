FROM node:20-alpine

# Set working directory
WORKDIR /usr/app

# Copy dependency files first (cache-friendly)
COPY package.json package-lock.json ./

# Install only production dependencies
RUN npm ci --omit=dev

# Copy application source
COPY . .

# Expose the port your app listens on
EXPOSE 3000

# ✅ IMPORTANT: start the app and keep container running
CMD ["npm", "start"]
