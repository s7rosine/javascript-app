FROM node:20-alpine

WORKDIR /usr/app

# Copy ONLY dependency files first (for cache + security)
COPY package.json package-lock.json ./

# Install prod dependencies deterministically
RUN npm ci --omit=dev

#

