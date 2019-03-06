FROM debian:stretch

LABEL "name"="Cabal"
LABEL "maintainer"="GitHub Actions <support+actions@github.com>"
LABEL "version"="0.1.0"

LABEL "com.github.actions.name"="Cabal"
LABEL "com.github.actions.description"="Runs cabal"
LABEL "com.github.actions.icon"="git-pull-request"
LABEL "com.github.actions.color"="purple"

ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    PATH=/root/.cabal/bin:/opt/ghc/bin:$PATH

RUN apt-get update && \
    apt-get install -y gnupg && \
    apt-get autoremove -y && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/*

RUN echo "deb http://downloads.haskell.org/debian stretch main" >> /etc/apt/sources.list && \
    apt-key adv --keyserver keyserver.ubuntu.com  --recv-keys BA3CBA3FFE22B574 && \
    apt-get update && \
    apt-get install -y \
      ghc-8.6.3 \
      cabal-install-2.4 && \
    apt-get autoremove -y && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/*

RUN cabal new-update

COPY LICENSE README.md THIRD_PARTY_NOTICE.md /

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
