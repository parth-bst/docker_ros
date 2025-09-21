# M1_WiredUp Docker Environment

ARM64 Docker environment based on Pi Zero 2W specifications, using Ubuntu 22.04 LTS Server, optimized for Apple Silicon.

## Docker plan 

it is the master plan that has to be kept updated and source of guidance.

Changes will be required in the Dockerfile and the docker-compose.yml file.

Sequence of building, depending on changes is:

1. Dockerfile - using build.sh script functions
2. docker-compose.yml - using docker.sh functions



## Quick Start to Building the Docker image

```bash
# Build and run
cd docker
./docker.sh build
./docker.sh up

# Access container
./docker.sh shell
./docker.sh exec python3 --version

# Stop
./docker.sh down
```

## Architecture

- **Base**: Ubuntu 22.04 LTS Server ARM64
- **Python**: 3.11.2 with exact package versions from `docker_plan.ltx`
- **Platform**: linux/arm64 (Apple Silicon compatible)
- **User**: Non-root `appuser` with sudo access

## Management Commands

```bash
./docker.sh build    # Build image
./docker.sh up       # Start container
./docker.sh down     # Stop container
./docker.sh shell    # Interactive shell
./docker.sh exec     # Execute command
./docker.sh logs     # View logs
./docker.sh status   # Container status
./docker.sh clean    # Remove volumes
./docker.sh rebuild  # Rebuild from scratch
```

## Configuration

### Volumes
- Project root → `/workspace`
- App data → `/app`
- Logs → `/var/log/app`

### Ports
- 8000:8000 (main app)
- 8080:8080 (alt port)
- 22:22 (SSH)
- 1883:1883 (MQTT)

### Resources
- Memory: 4GB limit, 1GB reserved
- CPU: 2.0 cores limit, 0.5 cores reserved

## Development Workflow

```bash
# Start environment
./docker.sh up -d

# Work with code
./docker.sh shell
cd /workspace
python3 your_script.py

# Or execute directly
./docker.sh exec python3 /workspace/your_script.py
```

## File Structure

```
docker/
├── docker.sh              # Management script
├── production/
│   ├── Dockerfile         # Container definition
│   ├── docker-compose.yml # Compose configuration
│   ├── build.sh          # Build script
│   ├── docker_plan.ltx   # Package specifications
│   └── README.md         # This file
```
