#!/bin/bash
#https://github.com/yjeanrenaud/rPi_check_throttled
# checks if the Raspberry Pi's Broadcom SoC is throttled and enumerates the reason for that.
# based upon the work of @HarlemSquirrel https://harlemsquirrel.github.io/shell/2019/01/05/monitoring-raspberry-pi-power-and-thermal-issues.html
# I just translated it to pure bash, without extra utils
# 2024, Yves Jeanrenaud

GET_THROTTLED_CMD="vcgencmd get_throttled"
declare -A MESSAGES=(
    [0]="Under-voltage!"
    [1]="ARM frequency capped!"
    [2]="Currently throttled!"
    [3]="Soft temperature limit active"
    [16]="Under-voltage has occurred since last reboot."
    [17]="Throttling has occurred since last reboot."
    [18]="ARM frequency capped has occurred since last reboot."
    [19]="Soft temperature limit has occurred"
)

echo "Checking for throttling issues since last reboot..."

throttled_output=$($GET_THROTTLED_CMD)
throttled_value=$(echo $throttled_output | awk -F'=' '{print $2}')
warnings=0

for position in "${!MESSAGES[@]}"; do
    mask=$((1 << position))
     if (( (throttled_value & mask) != 0 )); then
        echo "${MESSAGES[$position]}"
        warnings=$((warnings + 1))
    fi
done

if [ $warnings -eq 0 ]; then
    echo "Looking good!"
else
    echo "Houston, we may have a problem!"
fi
