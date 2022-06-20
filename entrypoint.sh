#!/bin/bash
set -e

rm -f /responsive_checker_app/tmp/pids/server.pid

exec "$@"