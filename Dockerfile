FROM node:22.14-alpine AS builder
WORKDIR /app
RUN corepack enable
COPY . .
RUN pnpm install --frozen-lockfile
RUN pnpm turbo build

FROM nginx:1.31-alpine
COPY --from=builder /app/apps/web/dist /usr/share/nginx/html
COPY --from=builder /app/apps/promotion/dist /usr/share/nginx/html/promotion
COPY --from=builder /app/apps/analytics/dist /usr/share/nginx/html/analytics

COPY nginx.conf /etc/nginx/conf.d/default.conf
