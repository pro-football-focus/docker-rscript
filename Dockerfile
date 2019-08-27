FROM alpine:3.10
MAINTAINER Geoff Lane <geoff.lane@pff.com>

ENV REFRESH 20190827

# Install build depdendencies
# libssh2 and libgit2 needed for gitr
RUN apk upgrade --update --no-cache && \
    apk --update --no-cache add \
    alpine-sdk coreutils wget git ca-certificates pkgconfig autoconf automake libtool nasm gcc gawk \
    linux-headers \
    libpng-dev ncurses-dev openssl-dev \
    libxml2-dev libxml2 \
    openssh-client libssh2 libssh2-dev libgit2-dev libgit2

# Install R 3.6
RUN apk add --no-cache R R-dev

# Install R dependencies
RUN R -e "install.packages(c('devtools', 'git2r', 'usethis', 'remotes'), repos='https://cloud.r-project.org', clean=TRUE, quiet=TRUE, INSTALL_opts=c('--no-html'))"
