#!/usr/bin/env sh
#
# Ping Identity DevOps - Docker Build Hooks
#
# Prints out variables and startup information when the server is started.
#
# This may be useful to "call home" or send a notification of startup to a command and control center
#

# shellcheck source=pingcommon.lib.sh
. "${HOOKS_DIR}/pingcommon.lib.sh"

run_hook "02-get-remote-server-profile.sh"

# Looks at all the vairables, and determins if the server is ready to run and creates
# a RUN_PLAN
run_hook "03-build-run-plan.sh"

# Checks and displays all the variables to the log
run_hook "04-check-variables.sh"

# Expants any templates (files ending with .subst), merging variables into files
run_hook "05-expand-templates.sh"

# Copies the product bits from the image into the new SERVER_ROOT if a new container has started
run_hook "06-copy-product-bits.sh"

# Applies the results of the staged server profile instance directory into SERVER_ROOT
run_hook "07-apply-server-profile.sh"

