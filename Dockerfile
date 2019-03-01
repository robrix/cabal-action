FROM debian:stretch

ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    PATH=/root/.cabal/bin:/opt/ghc/bin:$PATH

RUN echo "deb http://downloads.haskell.org/debian stretch main" >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y --allow-unauthenticated \
      ghc-8.6.3 \
      cabal-install-2.4 && \
    apt-get autoremove -y && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/*

CMD ["bash"]
