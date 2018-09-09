#!/bin/bash

echo -e  "\e[33mDisk usage of partitions in %\e[0m"
echo -e "\n"
df -h | awk '{ printf "%-20s %-40s\n", $1, $5}'
