FROM fedora

ENV PEPPER_FISH_THEME_ORIGIN_URL https://github.com/SLIB53/pepper-fish-theme.git
ENV PEPPER_FISH_THEME_DIR /tmp/workspace/github.com/slib53/pepper-fish-theme

# Install Base Setup

RUN dnf install --assumeyes bat fish git procps tree unzip which zip

RUN mkdir -p /root/.config/fish/functions && \
echo 'set fish_greeting' > /root/.config/fish/functions/fish_greeting.fish

# Upgrade to Latest Software

# DIRTY: for rolling release, instruction defines an inconsistent layer
RUN dnf upgrade --assumeyes

## install latest custom fish theme

# DIRTY: for rolling release, instruction defines an inconsistent layer
RUN git clone --branch release-bloobox --single-branch ${PEPPER_FISH_THEME_ORIGIN_URL} ${PEPPER_FISH_THEME_DIR} && \
cd ${PEPPER_FISH_THEME_DIR} && fish scripts/apply_theme.fish && \
rm -rf ${PEPPER_FISH_THEME_DIR}


# Configure

WORKDIR /home
CMD [ "fish" ]
