#!/bin/sh
set -e

wg-quick up /run/secrets/wg0.conf

sleep infinity &
wait
