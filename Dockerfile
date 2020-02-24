FROM centos:7
MAINTAINER itsinil@gmail.com

ENV GOLANG_VERSION 1.11.5

ENV GOLANG_DOWNLOAD_URL https://golang.org/dl/go$GOLANG_VERSION.linux-amd64.tar.gz
ENV GOLANG_DOWNLOAD_SHA256 ff54aafedff961eb94792487e827515da683d61a5f9482f668008832631e5d25
ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

RUN yum update -y \
 && yum install -y wget tar make git

RUN curl -fsSL "$GOLANG_DOWNLOAD_URL" -o golang.tar.gz
RUN echo "$GOLANG_DOWNLOAD_SHA256  golang.tar.gz" | sha256sum -c --status
RUN tar -C /usr/local -xzf golang.tar.gz
RUN rm golang.tar.gz
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"