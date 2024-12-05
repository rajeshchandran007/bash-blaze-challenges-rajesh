
#!/bin/bash

# Function to display system metrics (CPU, memory, disk space)
function view_system_metrics() {
    echo "---- System Metrics ----"
    # Fetch CPU usage using `top` command and extract the value using awk
    cpu_usage=$(top -bn 1 | grep '%Cpu' | awk '{print $2}')
    # Fetch memory usage using `free` command and extract the value using awk
    mem_usage=$(free | grep Mem | awk '{printf("%.1f", $3/$2 * 100)}')
    # Fetch disk space usage using `df` command and extract the value using awk
    disk_usage=$(df -h / | tail -1 | awk '{print $5}')
    
    echo "CPU Usage:  $cpu_usage%   Mem Usage:  $mem_usage%   Disk Space:  $disk_usage"
}

view_system_metrics

