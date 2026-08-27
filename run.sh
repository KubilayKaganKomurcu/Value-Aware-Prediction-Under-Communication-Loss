#!/bin/bash
# Python version = 3.8.10

ENV="SimpleSpreadBlind-v0"
ALGO="mappo_ns"
# Pick the method by config name (see src/config/custom_configs/):
#   "maro"    -> MARO baseline (Santos et al. 2025)
#   "va_maro" -> Value-Aware MARO (this work)
PERCEPTION="va_maro"
TIME_LIMIT=25

# Setup correct config file(s).
CONFIG_SOURCE="src/config/custom_configs/${PERCEPTION}.yaml"
cp $CONFIG_SOURCE src/config/perception.yaml

# Run.
for i in {0..2}
do
   python3 src/main.py --config=$ALGO --env-config=gymma with env_args.key=$ENV env_args.time_limit=$TIME_LIMIT seed=$i &
   echo "Running with seed=$i"
   sleep 2s
done
