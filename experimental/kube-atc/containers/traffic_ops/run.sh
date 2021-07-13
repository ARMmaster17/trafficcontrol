#!/usr/bin/env bash
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

# Script for running the Dockerfile for Traffic Ops.
# The Dockerfile sets up a Docker image which can be used for any new Traffic Ops container;
# This script, which should be run when the container is run (it's the ENTRYPOINT), will configure the container.
#
# The following environment variables must be set, ordinarily by `docker run -e` arguments:
# DB_SERVER
# DB_PORT
# DB_ROOT_PASS
# DB_USER
# DB_USER_PASS
# DB_NAME
# ADMIN_USER
# ADMIN_PASS
# DOMAIN
# TV_AES_KEY_LOCATION
# TV_BACKEND
# TV_DB_NAME
# TV_DB_PORT
# TV_DB_SERVER
# TV_DB_USER
# TV_DB_USER_PASS

# Check that env vars are set
envvars=(DB_SERVER DB_PORT DB_ROOT_PASS DB_USER DB_USER_PASS ADMIN_USER ADMIN_PASS)
for v in $envvars; do
	if [[ -z $$v ]]; then
		echo "$v is unset" >&2;
		exit 1;
	fi
done

export PATH="$PATH:/opt/traffic_ops/go/bin"

/opt/traffic_ops/install/bin/postinstall --debug -a --cfile /config/input.json -n --no-restart-to

cd /opt/traffic_opds/app

# CDNCONF=/opt/traffic_ops/app/conf/cdn.conf
# DBCONF=/opt/traffic_ops/app/conf/production/database.conf
mkdir -p /var/log/traffic_ops
touch "$TO_LOG_ERROR" "$TO_LOG_WARNING" "$TO_LOG_INFO" "$TO_LOG_DEBUG" "$TO_LOG_EVENT"
tail -qf "$TO_LOG_ERROR" "$TO_LOG_WARNING" "$TO_LOG_INFO" "$TO_LOG_DEBUG" "$TO_LOG_EVENT" &

tail -f /dev/null;