FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
RUN --mount=type=cache,target=/var/cache/apt/archives
RUN --mount=type=cache,target=/var/cache/apt/lists

RUN apt-get update
RUN apt-get install -y \
    pandoc \
    fonts-ipafont \
    fonts-ipaexfont \
    texlive-xetex \
    texlive-latex-recommended \
    texlive-latex-extra \
    texlive-fonts-recommended \
    texlive-fonts-extra
RUN apt-get install -y fc-cache -fv

WORKDIR /usr/share/pandoc/data/templates/
ADD https://github.com/Wandmalfarbe/pandoc-latex-template/releases/download/v2.0.0/Eisvogel-2.0.0.tar.gz .
RUN tar -zxf Eisvogel-2.0.0.tar.gz

ENTRYPOINT ["pandoc"]
