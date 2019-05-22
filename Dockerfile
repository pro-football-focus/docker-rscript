FROM alpine:3.9
MAINTAINER Geoff Lane <geoff.lane@profootballfocus.com>

# Make sure interactive install elements are hidden
ENV DEBIAN_FRONTEND noninteractive

# Install R and build dependencies
RUN apk --update --no-cache add \
    alpine-sdk coreutils wget git ca-certificates pkgconfig autoconf automake libtool nasm gcc bash gawk \
    libpng-dev ncurses-dev openssl-dev \
    linux-headers \
    openssh-client \
    R R-dev

# Install dependencies
RUN R -e "install.packages('devtools', repos='https://cloud.r-project.org')"
RUN R -e "install.packages('git2r', repos='https://cloud.r-project.org')"
RUN R -e "install.packages('usethis', repos='https://cloud.r-project.org')"
