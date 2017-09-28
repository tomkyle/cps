#!/usr/bin/env bash


# =============================================================
#  Creates a copy of the given file
#  with the gven suffix in file name
#
#  Usage:    $ cp-suffix <file> <suffix>
#
#  Example:  $ cp-suffix foo.pdf -bar
#            ...results in "foo-bar.pdf"
#
# =============================================================


# Runtime Environment
set -o nounset
set -o pipefail

# Not needed here since we evaluate the result of "cp" command.
# set -o errexit

# May be useful one day
# set -o xtrace


# Internal Field Separator
readonly DEFAULT_IFS="${IFS}"
readonly SAFER_IFS=$'\n\t'
IFS="${SAFER_IFS}"



# ---------------------------------------
# Print short help if no arguments
# ---------------------------------------

readonly SCRIPT_NAME=$(basename "${0}")

if [ "$#" -eq 0 ]; then
	echo "Usage: ${SCRIPT_NAME} <file> <suffix>"
	exit 1
fi


# -----------------------------------
# Prerequisites
# -----------------------------------

# Formatting stuff
readonly C_RED='\033[0;31m'
readonly C_GREEN='\033[0;32m'
readonly C_ORANGE=$(tput setaf 3)
readonly NC='\033[0m' # No Color

# Error message and error exit, redirecting stdout to stderr
function e_error {
	echo -e >&2 "${C_RED}✘ Error:${NC} ${*-}";
	exit 1;
}

function e_warning {
  echo -e "${C_ORANGE}❱ Warning:${NC} ${*-}"
}

function e_success () {
  echo -e "${C_GREEN}✔ Success:${NC} ${*-}"
}

function require  {
	command -v "${1}" >/dev/null 2>&1 || e_error "Program ${1} required, but it's not installed";
}

require cp


# -----------------------------------
# The business part
# -----------------------------------

function main {

	WORKFILE="${1}"
	SUFFIX="${2}"

	# Just in case $INPUT_FILE is NOT a regular file
	if [ ! -f "${WORKFILE}" ]; then
		e_warning "$(printf '"%s" is not a regular file. Ignoring.' "${WORKFILE}")"
		exit 1
	fi

	# File name magic
	source_file_extension="${WORKFILE##*.}";
	source_file_basename="${WORKFILE%.$source_file_extension}"
	source_file_basename="${source_file_basename##*/}" # remove trailing slash

	target_file="${source_file_basename}${SUFFIX}.${source_file_extension}"

	# Copy file
	if cp "${WORKFILE}" "${target_file}"; then
		e_success ""
		echo "${WORKFILE}" → "${target_file}"
	else
		exit 1
	fi
}

main "${1}" "${2}"



