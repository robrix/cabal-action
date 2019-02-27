FROM debian:stretch

ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    PATH=/root/.cabal/bin:/opt/ghc/bin:$PATH
