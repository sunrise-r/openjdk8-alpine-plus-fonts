FROM openjdk:8-jdk-alpine AS runner

RUN apk --no-cache add msttcorefonts-installer fontconfig && \
    update-ms-fonts && \
    fc-cache -f

