FROM perl:latest

RUN apt-get update -qqq && DEBIAN_FRONTEND=noninteractive apt-get install wget -y -qqq
WORKDIR /work

# Installation Process
# Link: https://www.tug.org/texlive/quickinstall.html
RUN wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
RUN tar -xzf install-tl-unx.tar.gz
COPY texlive.profile texlive.profile
RUN ./install-tl-*/install-tl --profile texlive.profile
RUN rm -rf install-tl-* texlive.profile
RUN apt-get remove perl -y -qqq && apt autoremove -y -qqq

ENV PATH=$PATH:/usr/local/texlive/2021/bin/x86_64-linux
ENV TEXINPUTS=/work//:
ENV TTFONTS=/work//:
ENV TEXMFOUTPUT=/tmp
RUN tlmgr install xetex
RUN tlmgr install geometry wrapfig vcell tabularray minifp environ etoolbox vwcol ragged2e enumitem \
    fontspec fontawesome5 lettrine tcolorbox pgfplots ninecolors pgf changepage hyphenat
