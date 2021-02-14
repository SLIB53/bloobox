FROM ghcr.io/slib53/bloobox

ARG TERRAFORM_ZIP_URL

# Install Google Cloud SDK

COPY ./google-cloud-sdk.repo /etc/yum.repos.d/

RUN dnf install google-cloud-sdk -y

# Install Terraform

RUN cd $TMP \
       && curl -o terraform.zip ${TERRAFORM_ZIP_URL} \
       && unzip terraform.zip \
       && sudo mv terraform /usr/local/bin/ \
       && rm terraform.zip
