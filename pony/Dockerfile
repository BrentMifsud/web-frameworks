FROM ponylang/shared-docker-ci-x86-64-unknown-linux-builder-with-openssl_1.1.1n

WORKDIR /src/main

COPY corral.json ./
RUN corral fetch

COPY main.pony ./

{{#environment}}
  ENV {{{.}}}
{{/environment}}

{{#before_command}}
  RUN {{{.}}}
{{/before_command}}

RUN corral run ponyc -- -Dopenssl_1.1.x -Dstatic -bjennet

FROM alpine

RUN apk --no-cache add libatomic libexecinfo libgcc

WORKDIR /opt/
COPY --from=0 /src/main/jennet ./
CMD ./jennet
