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
#-------------------------------------------------------
# Number of tasks
# Set either the total number of tasks (-n) or tasks per node (--ntasks-per-node)
# Please, recall to enable ONLY ONE of them (removing the space before SBATCH)
# SBATCH --ntasks-per-node=1
# SBATCH -n 16
# The previous two options are equivalent if you have a tasks_list.sh
# file with 16 lines
#
# -----------------------------------------------------
# Do not forget to set e-mail notifications
# SBATCH --mail-type=ALL   # Opts: NONE, BEGIN, END, FAIL, REQUEUE, ALL
# SBATCH --mail-user=<USER>@stanford.edu # Replace <user> with your address
#------------------------------------------------------
# Load launcher and set environment variables (do not touch)
module load launcher/${LAUNCHER_VERSION:-3.1.0}
#------------------------------------------------------

# Add your modules to load below

# Your job specification
export LAUNCHER_JOB_FILE=tasks_list.sh  # Replace with your tasks file
export LAUNCHER_WORKDIR=$(pwd)          # Modify when necessary


# Run parametric run (do not touch)
$LAUNCHER_DIR/paramrun
