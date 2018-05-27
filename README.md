# ONE BIT FLIX

Este projeto é baseado no [One Bit Flix by OneBitCode](https://github.com/OneBitCodeBlog/onebitflix)

Fora acrescido ao projeto original o **Docker**

## Para rodar a aplicação com docker

`docker-compose up`

## Para criar os bancos de dados (development, test)

`rails db:create POSTGRES_HOST=localhost POSTGRES_USER=postgres`

## Para rodar as migrações do banco de dados (PostgreSQL)

`rails db:migrate POSTGRES_HOST=localhost POSTGRES_USER=postgres`

## Para adicionar os dados fakes (ver db/seeds.rb) ao banco de dados

`rails db:seed POSTGRES_HOST=localhost POSTGRES_USER=postgres`

***GOD** is good*