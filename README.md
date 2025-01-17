# rPi_check_throttled
A small script to check if the Raspberry Pi SBC is throttled and why.
It is based upon the work of [@HarlemSquirrel](https://github.com/HarlemSquirrel): [Monitoring Raspberry Pi Power and Thermal Issues](https://harlemsquirrel.github.io/shell/2019/01/05/monitoring-raspberry-pi-power-and-thermal-issues.html).
I love that code for debugging and monitoring various issues on these single board computers, especially [Raspberry Pi Zero W](https://www.raspberrypi.com/products/raspberry-pi-zero-w/). But it runs on Python 2, which I deemed unneccessary. Hence, I translated it to a bash script.

# Depencencies and Prerequisites
- None. It runs as a pure bash script. No extra software needed.
- Obviously, you need to have access to the video core, hence the user needs to be part of the `video` user group:
  `sudo usermod -a -G video [USERNAME]`.
  The default user `pi` ususally already is in that group, so everything works fine with that. 

# Usage
just run the script:
`.\rPi_check_throttled.sh`
# Todos
- add some examples for permanent monitoring
- add exit codes for scripting compatiblity
