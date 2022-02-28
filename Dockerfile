FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive
RUN --mount=type=cache,target=/var/cache/apt/archives
RUN --mount=type=cache,target=/var/cache/apt/lists

RUN apt-get update && apt-get install -y tzdata
RUN apt-get install -y pandoc fonts-ipafont fonts-ipaexfont texlive-full unzip wget
RUN apt-get install -y fc-cache -fv 

RUN wget https://github.com/Wandmalfarbe/pandoc-latex-template/releases/download/v2.0.0/Eisvogel.zip
RUN unzip /Eisvogel.zip
RUN mv eisvogel.latex /usr/share/pandoc/data/templates/
ENTRYPOINT ["pandoc"]
