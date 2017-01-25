#!/bin/bash
#
# Simple SLURM script for submitting multiple serial
# jobs (e.g. parametric studies) using a script wrapper
# to launch the jobs.
#-------------------------------------------------------
#-------------------------------------------------------
#SBATCH -J JOBNAME                     # Replace JOBNAME
#SBATCH -N 1                           # Number of nodes
#SBATCH -p normal                      # Queue
#SBATCH -o JOBNAME-%j.out              # Replace JOBNAME
#SBATCH -t 01:00:00                    # Wallclock time
#
# Alternatively, set number of tasks or tasks per node
# Please, recall to enable one of them (no space before SBATCH)
# SBATCH --ntasks-per-node=16
# SBATCH -n 16
#
# Do not forget to set e-mail notifications
# SBATCH --mail-type=ALL   # Opts: NONE, BEGIN, END, FAIL, REQUEUE, ALL
# SBATCH --mail-user=<USER>@stanford.edu # Replace <user> with your address
#------------------------------------------------------
# Load launcher and set environment variables (do not touch)
module load launcher/3.0.1
#------------------------------------------------------

# Add your modules to load below

# Your job specification
export LAUNCHER_JOB_FILE=tasks_list.sh  # Replace with your tasks file
export LAUNCHER_WORKDIR=$(pwd)          # Modify when necessary


# Run parametric run (do not touch)
$LAUNCHER_DIR/paramrun
