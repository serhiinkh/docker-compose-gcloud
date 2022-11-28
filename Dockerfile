FROM docker:20.10

RUN apk --no-cache add curl nodejs npm bash python3
RUN curl -sSL https://sdk.cloud.google.com | bash
ENV PATH $PATH:/root/google-cloud-sdk/bin
RUN gcloud config set core/disable_usage_reporting true && \
    gcloud config set component_manager/disable_update_check true && \
    gcloud config set metrics/environment github_docker_image
RUN gcloud components update --quiet
RUN gcloud components install beta --quiet              
RUN gcloud -v
RUN node -v
RUN npm -v
RUN docker -v
RUN docker-compose -v