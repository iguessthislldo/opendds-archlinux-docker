FROM "archlinux:base-devel"

RUN pacman --sync --needed --noconfirm --refresh git && \
    useradd --create-home user && \
    cd /home/user && \
    sudo -u user git clone --depth 1 https://aur.archlinux.org/opendds-git.git && \
    cd opendds-git && \
    sudo -u user MAKEFLAGS="-j$(nproc)" makepkg --syncdeps --clean
