ARG APP_NAME="gitlab_ci_test"

FROM elixir:1.6-alpine as build

WORKDIR /opt/${APP_NAME}

ENV MIX_ENV=prod

RUN apk add --no-cache nodejs \
    && mix local.hex --force \
    && mix local.rebar --force

COPY . .

RUN mix do deps.get, compile, phx.digest \
    && ( cd ./assets ; npm install ) \
    && ./assets/node_modules/brunch/bin/brunch b -p ./assets/ \
    && mix release --no-tar --verbose

FROM alpine:3.8

WORKDIR /opt/app

ENV PORT="8080" \
    REPLACE_OS_VARS="true"

RUN apk add --no-cache bash openssl

COPY --from=build /opt/${APP_NAME}/_build/prod/rel/${APP_NAME} ./

EXPOSE $PORT

CMD ["/opt/app/gitlab_ci_test/bin/gitlab_ci_test", "foreground"]
