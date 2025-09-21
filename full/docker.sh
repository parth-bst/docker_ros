#!/bin/bash

# M1_WiredUp Full Docker Management (with ROS2 GUI tools)
COMPOSE_FILE="docker-compose.yml"

case "${1:-}" in
    "build")
        docker-compose -f $COMPOSE_FILE build
        ;;
    "up")
        docker-compose -f $COMPOSE_FILE up -d
        ;;
    "down")
        docker-compose -f $COMPOSE_FILE down
        ;;
    "restart")
        docker-compose -f $COMPOSE_FILE restart
        ;;
    "shell")
        docker-compose -f $COMPOSE_FILE exec m1-wiredup-full /bin/bash
        ;;
    "exec")
        shift && docker-compose -f $COMPOSE_FILE exec m1-wiredup-full "$@"
        ;;
    "logs")
        docker-compose -f $COMPOSE_FILE logs -f
        ;;
    "status")
        docker-compose -f $COMPOSE_FILE ps
        ;;
    "clean")
        docker-compose -f $COMPOSE_FILE down -v --remove-orphans
        ;;
    "rebuild")
        docker-compose -f $COMPOSE_FILE down
        docker-compose -f $COMPOSE_FILE build --no-cache
        docker-compose -f $COMPOSE_FILE up -d
        ;;
    "demo")
        docker-compose -f $COMPOSE_FILE exec m1-wiredup-full bash -c "source /opt/ros/jazzy/setup.bash && ros2 run demo_nodes_cpp talker"
        ;;
    *)
        echo "Usage: $0 {build|up|down|restart|shell|exec|logs|status|clean|rebuild|demo}"
        ;;
esac
