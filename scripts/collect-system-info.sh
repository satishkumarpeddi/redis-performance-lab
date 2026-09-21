#!/usr/bin/env bash

set -e

OUT="${1:-system-info.txt}"

{
    echo "===== DATE ====="
    date

    echo
    echo "===== HOST ====="
    hostname

    echo
    echo "===== HOSTNAMECTL ====="
    hostnamectl

    echo
    echo "===== CPU ====="
    lscpu

    echo
    echo "===== MEMORY ====="
    free -h

    echo
    echo "===== STORAGE ====="
    lsblk

    echo
    echo "===== KERNEL ====="
    uname -a

    echo
    echo "===== REDIS VERSION ====="
    redis-server --version

    echo
    echo "===== REDIS CLI ====="
    redis-cli --version

    echo
    echo "===== REDIS PING ====="
    redis-cli ping

    echo
    echo "===== REDIS MEMORY ====="
    redis-cli INFO memory

    echo
    echo "===== REDIS PERSISTENCE ====="
    redis-cli INFO persistence

    echo
    echo "===== REDIS REPLICATION ====="
    redis-cli INFO replication
} > "$OUT"

echo "System information written to $OUT"
