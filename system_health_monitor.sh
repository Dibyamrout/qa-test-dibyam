#!/bin/bash


CPU_THRESHOLD=80
MEMORY_THRESHOLD=80
DISK_THRESHOLD=80

check_cpu_usage() {
  > system_health.log
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
    cpu_usage=${cpu_usage%.*}  
    if [ "$cpu_usage" -gt "$CPU_THRESHOLD" ]; then
      echo "This Alert for CPU_USAGE ">> system_health.log
        echo "ALERT: CPU usage is at $cpu_usage%" >> system_health.log
    fi
}

check_memory_usage() {
    memory_usage=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
    memory_usage=${memory_usage%.*}  
    if [ "$memory_usage" -gt "$MEMORY_THRESHOLD" ]; then
      echo "This Alert for Memory_USAGE ">> system_health.log
        echo "ALERT: Memory usage is at $memory_usage%" >> system_health.log
    fi
}


check_disk_space() {
    disk_usage=$(df / | grep / | awk '{ print $5}' | sed 's/%//g')
    if [ "$disk_usage" -gt "$DISK_THRESHOLD" ]; then
      echo "This Alert for Disk_USAGE ">> system_health.log
        echo "ALERT: Disk space usage is at $disk_usage%" >> system_health.log
    fi
}

check_running_processes() {
    running_processes=$(ps -ef --sort=-%mem | awk 'NR<=10{print $0}' | awk '{print $2}')
    echo "This Alert for Running Processes " >> system_health.log
    echo "Top 10 processes by memory usage:" >> system_health.log
    echo "$running_processes" >> system_health.log
}

check_cpu_usage
check_memory_usage
check_disk_space
check_running_processes


