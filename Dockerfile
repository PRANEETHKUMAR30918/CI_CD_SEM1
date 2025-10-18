# Use Node.js to build the frontend
FROM node:18 AS builder
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

# Use a lightweight server to serve static files
FROM node:18
WORKDIR /app
RUN npm install -g serve
COPY --from=builder /app/dist /app/dist
CMD ["serve", "-s", "dist", "-l", "5173"]