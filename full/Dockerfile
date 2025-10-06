# Dockerfile for M1_WiredUp project - ROS2 Jazzy Development
# Based on docker_plan.ltx specifications
# Optimized for ARM64 (Apple Silicon MacBook)

FROM ubuntu:24.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1
ENV ROS_DISTRO=jazzy

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
    python3-pigpio \
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

# Install Python packages with specific versions
RUN pip3 install --no-cache-dir --break-system-packages \
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
    urllib3 \
    # ML packages
    tensorflow

# Add ROS2 repository and install ROS2 Jazzy development packages
RUN apt-get update && apt-get install -y \
    curl \
    gnupg2 \
    lsb-release \
    && curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null \
    && apt-get update && apt-get install -y \
    # ROS2 Jazzy base packages
    ros-jazzy-ros-core \
    ros-jazzy-ros-base \
    # Development tools
    ros-jazzy-ament-cmake \
    ros-jazzy-ament-cmake-auto \
    ros-jazzy-ament-cmake-copyright \
    ros-jazzy-ament-cmake-cppcheck \
    ros-jazzy-ament-cmake-cpplint \
    ros-jazzy-ament-cmake-flake8 \
    ros-jazzy-ament-cmake-gmock \
    ros-jazzy-ament-cmake-gtest \
    ros-jazzy-ament-cmake-lint-cmake \
    ros-jazzy-ament-cmake-pep257 \
    ros-jazzy-ament-cmake-pycodestyle \
    ros-jazzy-ament-cmake-pyflakes \
    ros-jazzy-ament-cmake-pytest \
    ros-jazzy-ament-cmake-uncrustify \
    ros-jazzy-ament-cmake-xmllint \
    ros-jazzy-ament-lint \
    ros-jazzy-ament-lint-auto \
    ros-jazzy-ament-lint-common \
    ros-jazzy-ament-lint-cmake \
    # Core ROS2 packages
    ros-jazzy-rclcpp \
    ros-jazzy-rclpy \
    ros-jazzy-ros2cli \
    ros-jazzy-ros2launch \
    ros-jazzy-ros2run \
    ros-jazzy-ros2topic \
    ros-jazzy-ros2node \
    ros-jazzy-ros2service \
    ros-jazzy-ros2param \
    ros-jazzy-ros2interface \
    ros-jazzy-ros2action \
    ros-jazzy-ros2component \
    ros-jazzy-ros2pkg \
    # Demo packages
    ros-jazzy-demo-nodes-cpp \
    ros-jazzy-demo-nodes-py \
    # Robot-specific packages
    ros-jazzy-robot-state-publisher \
    ros-jazzy-joint-state-publisher \
    ros-jazzy-xacro \
    ros-jazzy-urdf \
    ros-jazzy-tf2 \
    ros-jazzy-tf2-tools \
    ros-jazzy-tf2-ros \
    # C++ Development packages
    ros-jazzy-cv-bridge \
    ros-jazzy-image-transport \
    libcurl4-openssl-dev \
    libssl-dev \
    nlohmann-json3-dev \
    # ML and Development tools
    python3.12-dev \
    cython3 \
    build-essential \
    python3-rosdep \
    python3-colcon-common-extensions \
    python3-vcstool \
    # ROS workflow tools
    python3-rosinstall \
    python3-rosinstall-generator \
    python3-wstool \
    # Re-Speaker specific packages
    flex \
    bison \
    bc \
    libncurses5-dev \
    libncursesw5-dev \
    device-tree-compiler \
    libatlas-base-dev \
    alsa-utils \
    python3-spidev \
    python3-rpi.gpio \
    linux-headers-generic \
    && rm -rf /var/lib/apt/lists/*

# Initialize rosdep and configure dpkg
RUN dpkg --configure -a \
    && rosdep init || true \
    && rosdep update

# Set up working directory
WORKDIR /workspace

# Create a non-root user for security
RUN useradd -m -s /bin/bash appuser && \
    usermod -aG sudo appuser && \
    echo "appuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    echo "appuser:admin" | chpasswd && \
    mkdir -p /home/appuser/.ssh && \
    chmod 700 /home/appuser/.ssh && \
    chown appuser:appuser /home/appuser/.ssh

# Configure SSH for automatic startup and passwordless login
# SSH listens on port 2222 to avoid conflict with host SSH when using host networking
RUN mkdir -p /var/run/sshd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config && \
    sed -i 's/#Port 22/Port 2222/' /etc/ssh/sshd_config && \
    echo "Port 2222" >> /etc/ssh/sshd_config && \
    echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config && \
    echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config && \
    echo "AuthorizedKeysFile .ssh/authorized_keys" >> /etc/ssh/sshd_config && \
    systemctl enable ssh

# Set up ROS2 environment
RUN echo "source /opt/ros/jazzy/setup.bash" >> /home/appuser/.bashrc \
    && echo "source /opt/ros/jazzy/setup.bash" >> /root/.bashrc \
    && echo "export TURTLEBOT3_MODEL=burger" >> /home/appuser/.bashrc \
    && echo "export TURTLEBOT3_MODEL=burger" >> /root/.bashrc

# Switch to non-root user
USER appuser

# Expose ports for ROS2 and SSH
EXPOSE 11311 11345 2222

# Set default command
CMD ["/bin/bash"]
