# use of ubuntu 19.10 linux/AMD64
FROM ubuntu:eoan@sha256:7ce552ad1c3e94a5c3d2bb24c07000c34a4bb43fd9b379652b2c80593a018e80

WORKDIR /home/dev

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    cmake=3.13.4-1build1 \
    libc6-i386=2.30-0ubuntu2.1 \
    bzip2=1.0.6-9.2 \
    build-essential=12.8ubuntu1 \
    doxygen=1.8.13-10ubuntu3 \
    lcov=1.14-2 \
    graphviz=2.40.1-7build1 \
    git=1:2.20.1-2ubuntu1.19.10.1 \
    ca-certificates=20190110 \
    curl=7.65.3-1ubuntu3 \
    python=2.7.17-1 \
    && rm -rf /var/lib/apt/lists/* \
    && cmake --version \
    && export GCC_URL="https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2019q4/RC2.1/gcc-arm-none-eabi-9-2019-q4-major-x86_64-linux.tar.bz2?revision=6e63531f-8cb1-40b9-bbfc-8a57cdfc01b4&la=en&hash=F761343D43A0587E8AC0925B723C04DBFB848339" \
    && tar -jxf gcc.tar.bz2 --strip=1 \
    && rm -f gcc.tar.bz2 \
    && rm -rf share/doc \
    #&& curl -L "$GCC_URL" -o gcc.tar.bz2 \
    && apt-get purge -y \
    wget \
    bzip2

ENV PATH "/home/dev/bin:$PATH"

WORKDIR /usr/project

CMD ["cmake"]
