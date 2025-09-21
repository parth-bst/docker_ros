# Dockerfile for M1_WiredUp project
# Based on docker_plan.ltx specifications
# Optimized for ARM64 (Apple Silicon MacBook)

FROM --platform=linux/arm64 ubuntu:22.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1
ENV ROS_DISTRO=humble

# Update package lists and install system dependencies
RUN apt-get update && apt-get install -y \
    # Core system packages
    avahi-daemon \
    base-files \
    base-passwd \
    bash \
    bash-completion \
    bc \
    bison \
    bsdutils \
    build-essential \
    ca-certificates \
    cifs-utils \
    cmake \
    console-setup \
    coreutils \
    cpio \
    cron \
    # cron-daemon-common removed - not available in Ubuntu
    curl \
    dash \
    debconf \
    debconf-i18n \
    debconf-utils \
    debian-archive-keyring \
    debianutils \
    device-tree-compiler \
    diffutils \
    dkms \
    dmidecode \
    dmsetup \
    dosfstools \
    dphys-swapfile \
    dpkg \
    e2fsprogs \
    ed \
    ethtool \
    fake-hwclock \
    fbset \
    fdisk \
    file \
    findutils \
    # Pi-specific firmware packages removed for standard Ubuntu
    flex \
    gcc-12-base \
    gdb \
    git \
    gpgv \
    gpiod \
    grep \
    gzip \
    hostname \
    htop \
    i2c-tools \
    init \
    init-system-helpers \
    initramfs-tools \
    iproute2 \
    iputils-ping \
    isc-dhcp-client \
    isc-dhcp-common \
    keyboard-configuration \
    kmod \
    # kms++-utils removed - not available in standard Ubuntu
    less \
    libacl1 \
    libapparmor1 \
    libapt-pkg6.0 \
    libargon2-1 \
    libasound2-plugins \
    libatlas-base-dev \
    libattr1 \
    libaudit-common \
    libaudit1 \
    libblkid1 \
    # libbpf1 removed - not available in Ubuntu 22.04
    libbsd0 \
    libbz2-1.0 \
    libc-bin \
    libc6 \
    libcap-ng0 \
    libcap2 \
    libcap2-bin \
    libcom-err2 \
    libcrypt1 \
    libcryptsetup12 \
    libdb5.3 \
    libdebconfclient0 \
    libdevmapper1.02.1 \
    libedit2 \
    libelf1 \
    libext2fs2 \
    libfdisk1 \
    libffi8 \
    libgcc-s1 \
    libgcrypt20 \
    libgmp10 \
    libgnutls30 \
    libgpg-error0 \
    libgssapi-krb5-2 \
    libhogweed6 \
    libidn2-0 \
    libip4tc2 \
    libjansson4 \
    libjson-c5 \
    libk5crypto3 \
    libkeyutils1 \
    libkmod2 \
    libkrb5-3 \
    libkrb5support0 \
    liblocale-gettext-perl \
    liblz4-1 \
    liblzma5 \
    libmd0 \
    libmnl0 \
    libmount1 \
    libmtp-runtime \
    libncurses5-dev \
    libncursesw5-dev \
    libncursesw6 \
    libnettle8 \
    libnewt0.52 \
    libnftables1 \
    libnftnl11 \
    libp11-kit0 \
    # libpam-chksshpwd removed - not available in standard Ubuntu
    libpam-modules \
    libpam-modules-bin \
    libpam-runtime \
    libpam0g \
    libpcre2-8-0 \
    libpopt0 \
    # libproc2-0 removed - not available in Ubuntu 22.04
    libreadline8 \
    libseccomp2 \
    libselinux1 \
    libsemanage-common \
    libsemanage2 \
    libsepol2 \
    libslang2 \
    libsmartcols1 \
    libss2 \
    libssl-dev \
    libssl3 \
    libstdc++6 \
    # libsystemd-shared removed - not available in Ubuntu 22.04
    libsystemd0 \
    libtasn1-6 \
    libtext-charwidth-perl \
    libtext-iconv-perl \
    libtext-wrapi18n-perl \
    libtinfo6 \
    libtirpc-common \
    libtirpc3 \
    libudev1 \
    libunistring2 \
    libuuid1 \
    libxtables12 \
    libxxhash0 \
    libzstd1 \
    # Pi-specific kernel packages removed - not available in standard Ubuntu
    locales \
    login \
    logrotate \
    logsave \
    lua5.1 \
    luajit \
    man-db \
    manpages-dev \
    mawk \
    mkvtoolnix \
    mount \
    nano \
    ncdu \
    ncurses-base \
    ncurses-bin \
    net-tools \
    netbase \
    network-manager \
    nfs-common \
    nftables \
    ntfs-3g \
    openssl \
    p7zip-full \
    parted \
    passwd \
    pciutils \
    perl-base \
    # pi-bluetooth and pigpio removed - Pi-specific packages
    pkg-config \
    policykit-1 \
    portaudio19-dev \
    procps \
    psmisc \
    python-is-python3 \
    python3-libgpiod \
    python3-pip \
    python3-pyaudio \
    python3-smbus2 \
    python3-spidev \
    python3-venv \
    # All raspberrypi-* packages removed - Pi-specific packages
    readline-common \
    # rpi-* packages removed - Pi-specific packages
    rsync \
    sed \
    sensible-utils \
    ssh \
    ssh-import-id \
    strace \
    sudo \
    systemd \
    systemd-sysv \
    systemd-timesyncd \
    sysvinit-utils \
    tar \
    tasksel \
    tasksel-data \
    tzdata \
    udev \
    udisks2 \
    unzip \
    usb-modeswitch \
    usbutils \
    # userconf-pi removed - Pi-specific package
    # usr-is-merged removed - not available in Ubuntu 22.04
    util-linux \
    # util-linux-extra removed - not available in Ubuntu 22.04
    v4l-utils \
    vim \
    vim-common \
    vim-tiny \
    wget \
    whiptail \
    wireless-tools \
    wpasupplicant \
    zip \
    zlib1g \
    && rm -rf /var/lib/apt/lists/*

# Add ROS2 repository and install ROS2 Humble
RUN apt-get update && apt-get install -y \
    curl \
    gnupg2 \
    lsb-release \
    && curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null \
    && apt-get update && apt-get install -y \
    ros-humble-ros-base \
    python3-rosdep \
    python3-colcon-common-extensions \
    && rm -rf /var/lib/apt/lists/*

# Initialize rosdep
RUN rosdep init || true \
    && rosdep update

# Install Python packages with specific versions
RUN pip3 install --no-cache-dir \
    certifi==2022.9.24 \
    chardet==5.1.0 \
    charset-normalizer \
    distro \
    idna \
    lgpio \
    PyAudio \
    pycryptodomex \
    requests \
    # RPi.GPIO removed - Pi-specific package
    six \
    smbus2 \
    spidev \
    toml \
    urllib3

# Set up working directory
WORKDIR /app

# Copy application code (adjust paths as needed)
# COPY . /app/

# Create a non-root user for security
RUN useradd -m -s /bin/bash appuser && \
    usermod -aG sudo appuser && \
    echo "appuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    echo "appuser:admin" | chpasswd

# Set up ROS2 environment
RUN echo "source /opt/ros/humble/setup.bash" >> /home/appuser/.bashrc \
    && echo "source /opt/ros/humble/setup.bash" >> /root/.bashrc

# Switch to non-root user
USER appuser

# Expose ports (adjust as needed for your application)
# EXPOSE 8000

# Set default command
CMD ["/bin/bash"]
