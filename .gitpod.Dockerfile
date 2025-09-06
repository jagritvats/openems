FROM gitpod/workspace-postgres

RUN bash -c ". /home/gitpod/.sdkman/bin/sdkman-init.sh \
             && sdk install java 21.0.2-tem"

# ensure required tools are available
RUN sudo apt-get update \
    && sudo apt-get install -y gnupg \
    && sudo rm -rf /var/lib/apt/lists/*

# configure java path for subsequent shells
ENV JAVA_HOME=/home/gitpod/.sdkman/candidates/java/current
ENV PATH="$JAVA_HOME/bin:$PATH"

# disable angular analytics
ENV NG_CLI_ANALYTICS=false

# Docker build does not rebuild an image when a base image is changed, increase this counter to trigger it.
ENV TRIGGER_REBUILD 4

RUN npm install -g @angular/cli 

# Install odoo
ENV ODOO_VERSION 16.0
ENV ODOO_RELEASE latest
RUN curl -o odoo.deb -sSL http://nightly.odoo.com/${ODOO_VERSION}/nightly/deb/odoo_${ODOO_VERSION}.${ODOO_RELEASE}_all.deb \
    && sudo apt-get update \
    && sudo apt-get -y install --no-install-recommends ./odoo.deb \
    && sudo rm -rf /var/lib/apt/lists/* odoo.deb

# Install wkhtmltopdf
ENV WKHTMLTOPDF_VERSION 0.12.6.1-2
ENV WKHTMLTOPDF_RELEASE jammy_amd64
RUN curl -o wkhtmltox.deb -sSL https://github.com/wkhtmltopdf/packaging/releases/download/${WKHTMLTOPDF_VERSION}/wkhtmltox_${WKHTMLTOPDF_VERSION}.${WKHTMLTOPDF_RELEASE}.deb \
    && sudo apt-get update \
    && sudo apt-get install -y ./wkhtmltox.deb \
    && sudo rm -rf /var/lib/apt/lists/* wkhtmltox.deb
