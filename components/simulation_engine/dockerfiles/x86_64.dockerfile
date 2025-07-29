FROM base.images.ubuntu.24.04_ros.jazzy:x86_64.0.2

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ros-jazzy-ros-gz \
        ros-jazzy-gz-ros2-control-demos \
        ros-jazzy-joint-state-publisher-gui \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

RUN source /opt/ros/jazzy/setup.bash && \
    gz fuel download -u https://fuel.gazebosim.org/1.0/richardtops/worlds/tugbot_depot
    
ENV GZ_SIM_RESOURCE_PATH=/robot/src/gazebo/resources/models:
