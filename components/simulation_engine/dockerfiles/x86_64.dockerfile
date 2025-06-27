ARG REGISTRY_ENDPOINT
FROM ${REGISTRY_ENDPOINT}/raya.core.base_images.ros_humble:x86_64.4.36.pr7.0

ENV SHELL=/bin/bash
SHELL ["/bin/bash", "-c"]

### All the components based on the image ros_humble (x86_64) must include this step
RUN rm -rf /usr/share/keyrings/kitware*.gpg && \
    rm -rf /usr/share/keyrings/ros*.gpg && \
    curl -fsSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg && \
    curl -fsSL https://apt.kitware.com/keys/kitware-archive-latest.asc | gpg --dearmor > /usr/share/keyrings/kitware-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu jammy main" > /etc/apt/sources.list.d/ros2.list && \
    echo "deb [signed-by=/usr/share/keyrings/kitware-archive-keyring.gpg] https://apt.kitware.com/ubuntu focal main" > /etc/apt/sources.list.d/kitware.list && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean
###

RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-humble-navigation2 \
    ros-humble-nav2-bringup \
    ros-humble-turtlebot3* \
    ros-humble-urdf-tutorial \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

