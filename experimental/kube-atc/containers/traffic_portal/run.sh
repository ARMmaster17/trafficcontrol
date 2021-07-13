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


NAME="Traffic Portal Application"
NODE_BIN_DIR="/usr/bin"
NODE_PATH="/opt/traffic_portal/node_modules"
FOREVER_BIN_DIR="/opt/traffic_portal/node_modules/forever/bin"
APPLICATION_PATH="/opt/traffic_portal/server.js"
PIDFILE="/var/run/traffic_portal.pid"
LOGFILE="/var/log/traffic_portal/traffic_portal.log"
MIN_UPTIME="5000"
SPIN_SLEEP_TIME="2000"

PATH=$FOREVER_BIN_DIR:$NODE_BIN_DIR:$PATH
forever \
    --pidFile $PIDFILE \
    -a \
    -l $LOGFILE \
    --minUptime $MIN_UPTIME \
    --spinSleepTime $SPIN_SLEEP_TIME \
    start $APPLICATION_PATH

tail -f /dev/null