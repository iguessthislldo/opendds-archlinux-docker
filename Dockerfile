FROM "archlinux:base-devel"

ARG AUR_PACKAGE=opendds-git

RUN pacman --sync --needed --noconfirm --refresh git

# makepkg can't be run as root
RUN groupadd -f users
RUN useradd --create-home user
USER user

COPY --chown=user ${AUR_PACKAGE} /home/user/${AUR_PACKAGE}
WORKDIR /home/user/${AUR_PACKAGE}
RUN ls -al
RUN MAKEFLAGS="-j$(nproc)" makepkg --syncdeps --clean
