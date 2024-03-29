FROM docker:25.0.5

RUN apk --no-cache add curl nodejs npm bash python3 py3-pip
RUN curl -sSL https://sdk.cloud.google.com | bash
ENV PATH $PATH:/root/google-cloud-sdk/bin
RUN gcloud config set core/disable_usage_reporting true && \
    gcloud config set component_manager/disable_update_check true && \
    gcloud config set metrics/environment github_docker_image
RUN gcloud components update --quiet
RUN gcloud components install beta --quiet  
RUN gcloud components install alpha --quiet
RUN gcloud components install log-streaming --quiet
RUN apk add py3-grpcio
ENV CLOUDSDK_PYTHON_SITEPACKAGES=1
RUN gcloud -v
RUN node -v
RUN npm -v
RUN docker -v
RUN docker-compose -v