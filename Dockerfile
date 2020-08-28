FROM openjdk:8-jdk-alpine AS runner

RUN apk add --no-cache msttcorefonts-installer fontconfig
RUN update-ms-fonts

# Google fonts
RUN wget https://github.com/google/fonts/archive/master.tar.gz -O gf.tar.gz
RUN tar -xf gf.tar.gz
RUN mkdir -p /usr/share/fonts/truetype/google-fonts
RUN find $PWD/fonts-master/ -name "*.ttf" -exec install -m644 {} /usr/share/fonts/truetype/google-fonts/ \; || return 1
RUN rm -f gf.tar.gz
RUN fc-cache -f && rm -rf /var/cache/*

