FROM "archlinux:base-devel"

ARG AUR_PACKAGE=opendds-git

# makepkg can't be run as root
RUN useradd --create-home user
USER user

COPY --chown=user ${AUR_PACKAGE} /home/user/${AUR_PACKAGE}
WORKDIR /home/user/${AUR_PACKAGE}
RUN MAKEFLAGS="-j$(nproc)" makepkg --syncdeps --clean
