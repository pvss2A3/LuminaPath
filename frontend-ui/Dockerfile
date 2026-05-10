# Stage 1: Build React App
FROM node:20-alpine AS build
WORKDIR /app

# Copy only package files first to leverage Docker caching
COPY package*.json ./

# Install dependencies - the --force helps bypass some platform conflicts
RUN npm install

# Copy the rest of the source code
COPY . .

# Run the build
RUN npm run build

# Stage 2: Serve with Nginx
FROM nginx:stable-alpine
# Vite build output goes to /app/dist
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]