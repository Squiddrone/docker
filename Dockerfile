# use of ubuntu 19.10 linux/AMD64
FROM ubuntu:eoan@sha256:7ce552ad1c3e94a5c3d2bb24c07000c34a4bb43fd9b379652b2c80593a018e80

WORKDIR /home/dev

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    build-essential=12.8* \
    bzip2=1.0.* \
    ca-certificates=20190110 \
    clang-format=1:9.0-* \
    cmake=3.13.* \
    curl=7.65.* \
    doxygen=1.8.* \
    git=1:2.20.* \
    graphviz=2.40.* \
    lcov=1.14-* \
    libc6-i386=2.30-* \
    python=2.7.* \
    && rm -rf /var/lib/apt/lists/* \
    && export GCC_URL="https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2019q4/RC2.1/gcc-arm-none-eabi-9-2019-q4-major-x86_64-linux.tar.bz2" \
    && curl -L "$GCC_URL" -o gcc.tar.bz2 \
    && tar -jxf gcc.tar.bz2 --strip=1 \
    && rm -f gcc.tar.bz2 \
    && rm -rf share/doc \
    && apt-get purge -y \
    bzip2

ENV PATH "/home/dev/bin:$PATH"

WORKDIR /usr/project

CMD ["cmake"]
