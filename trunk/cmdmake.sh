#!/bin/sh

./build_firmware  2>&1 | tee $(date +'%Y%m%d-%H%M%S').log
