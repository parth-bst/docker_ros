# M1_WiredUp Full Docker Environment

Complete ROS2 environment with GUI tools, demo packages, and robot-specific packages, optimized for Apple Silicon MacBook.

## Features

### ROS2 Packages
- **Full Desktop**: `ros-humble-desktop` with GUI tools
- **Demo Packages**: `demo-nodes-cpp`, `demo-nodes-py`
- **Robot Packages**: `robot-state-publisher`, `joint-state-publisher`, `xacro`, `urdf`
- **Visualization**: `rviz2`, `rqt`, `rqt-common-plugins`
- **Simulation**: `gazebo-ros-pkgs`, `gazebo-ros`, `gazebo-plugins`
- **Navigation**: `nav2-bringup`, `navigation2`, `slam-toolbox`
- **TurtleBot3**: Complete simulation packages

### GUI Support (MacBook Silicon)
- **X11 Forwarding**: Configured for MacBook display
- **Gazebo**: Physics simulation environment
- **RViz2**: 3D visualization tool
- **RQT**: GUI framework with plugins

## Quick Start

```bash
cd docker/full
./docker.sh build
./docker.sh up -d
./docker.sh shell
```

## Management Commands

```bash
./docker.sh build    # Build full image
./docker.sh up       # Start container
./docker.sh down     # Stop container
./docker.sh shell    # Interactive shell
./docker.sh gazebo   # Launch Gazebo
./docker.sh rviz     # Launch RViz2
./docker.sh demo     # Run demo nodes
./docker.sh exec     # Execute command
./docker.sh logs     # View logs
./docker.sh status   # Container status
```

## GUI Applications

### Gazebo Simulation
```bash
./docker.sh gazebo
# Or manually:
source /opt/ros/humble/setup.bash
gazebo
```

### RViz2 Visualization
```bash
./docker.sh rviz
# Or manually:
source /opt/ros/humble/setup.bash
rviz2
```

### Demo Nodes
```bash
./docker.sh demo
# Or manually:
source /opt/ros/humble/setup.bash
ros2 run demo_nodes_cpp talker
```

## TurtleBot3 Simulation

```bash
# Set TurtleBot3 model
export TURTLEBOT3_MODEL=burger

# Launch Gazebo simulation
ros2 launch turtlebot3_gazebo empty_world.launch.py

# Launch RViz2
ros2 launch turtlebot3_navigation2 navigation2.launch.py
```

## Configuration

### Volumes
- Project root → `/workspace`
- App data → `/app`
- Logs → `/var/log/app`
- X11 socket → `/tmp/.X11-unix`

### Ports
- 11311:11311 (ROS Master)
- 11345:11345 (Parameter Server)
- 6080:6080 (noVNC)
- 8080:8080 (Web interface)
- 22:22 (SSH)

### Resources
- Memory: 8GB limit, 2GB reserved
- CPU: 4.0 cores limit, 1.0 core reserved

## MacBook Silicon Setup

### X11 Forwarding
```bash
# Install XQuartz (if not already installed)
brew install --cask xquartz

# Start XQuartz and allow connections
xhost +localhost
```

### GUI Access
The container is pre-configured with:
```bash
export DISPLAY=host.docker.internal:0
```

## Development Workflow

```bash
# Start environment
./docker.sh up -d

# Access container
./docker.sh shell

# Work with ROS2
source /opt/ros/humble/setup.bash
cd /workspace/ros2_ws
colcon build

# Run simulations
ros2 launch turtlebot3_gazebo empty_world.launch.py
```

## File Structure

```
docker/full/
├── Dockerfile              # Full ROS2 with GUI tools
├── docker-compose.yml      # Container configuration
├── docker.sh              # Management script
├── build.sh               # Build script
├── .dockerignore          # Docker ignore file
└── README.md              # This file
```

## Troubleshooting

### GUI Not Working
```bash
# Check X11 forwarding
echo $DISPLAY

# Restart XQuartz
brew services restart xquartz
xhost +localhost
```

### Memory Issues
```bash
# Check container resources
./docker.sh exec free -h

# Adjust memory limits in docker-compose.yml
```

### Gazebo Not Starting
```bash
# Check Gazebo installation
./docker.sh exec gazebo --version

# Launch with verbose output
./docker.sh exec bash -c "source /opt/ros/humble/setup.bash && gazebo --verbose"
```
