# Simple Dockerfile for Vue 3 + Vite on Coolify

# Build Stage
FROM node:20-alpine AS build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

# ARGS for Build Time Variables (Coolify injects these)
ARG VITE_SWISH_NUMBER
ARG VITE_MERCHANT_NAME
ARG VITE_SUPABASE_URL
ARG VITE_SUPABASE_ANON_KEY

# Make them available to the build process
ENV VITE_SWISH_NUMBER=$VITE_SWISH_NUMBER
ENV VITE_MERCHANT_NAME=$VITE_MERCHANT_NAME
ENV VITE_SUPABASE_URL=$VITE_SUPABASE_URL
ENV VITE_SUPABASE_ANON_KEY=$VITE_SUPABASE_ANON_KEY

RUN npm run build

# Production Stage
FROM nginx:alpine AS production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]