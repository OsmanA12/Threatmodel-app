FROM node:18-alpine AS builder

WORKDIR /app

COPY package.json yarn.lock ./

RUN yarn install --frozen-lockfile

COPY . .

RUN yarn build

#Stage 2
FROM node:18-alpine

WORKDIR /app

RUN yarn global add serve

COPY --from=builder /app/build /app/build

EXPOSE 3000

CMD ["serve", "-s", "build", "-l", "3000"]