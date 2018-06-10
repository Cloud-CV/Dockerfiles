#!/bin/bash

# Get the Dockerfiles present
IFS=$'\n'
files=( $(find -L . -iname '*Dockerfile' | sed 's|./||' | sort) )
unset IFS

for f in "${files[@]}"; do
	if ! [[ -e "$f" ]]; then
		continue
	fi

	build_dir=$(dirname "$f")
	base="origami"
	suite="$(echo build_dir | sed -e 's/\//-/g')"


	if [[ -z "$suite" ]]; then
		suite=latest
	fi

	(
	set -x
	docker build -t ${base}:${suite} ${build_dir}
	)

	echo "                       ---                                   "
	echo "Successfully built ${base}:${suite} with context ${build_dir}"
	echo "                       ---                                   "
done
