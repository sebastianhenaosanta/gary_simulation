ARG REGISTRY_ENDPOINT
FROM ${REGISTRY_ENDPOINT}/raya.core.base_images.ros_humble:jetsonorin.4.17.beta

ENV DEBIAN_FRONTEND=noninteractive


RUN apt-get update -y


# RUN apt-get update && \
#     apt-get install -y --no-install-recommends \
#         ros-humble-ros2-control \
#         ros-humble-ros2-controllers \
#     && rm -rf /var/lib/apt/lists/* \
#     && apt-get clean


