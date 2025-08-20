#!/usr/bin/env bash

: "${SQL_SERVER_HOST:=localhost}"
: "${SQL_SERVER_PORT:=1433}"
: "${SQL_SERVER_USER:=sa}"

start_sql_server() {
    /opt/mssql/bin/sqlservr &
    export SQL_SERVER_PID=$!

    local timeout="${1:-120}"
    local start=$SECONDS

    while ! /opt/mssql-tools18/bin/sqlcmd -C -S "${SQL_SERVER_HOST},${SQL_SERVER_PORT}" -U "${SQL_SERVER_USER}" -P "${MSSQL_SA_PASSWORD}" -Q "SELECT 1" -b -l 1 >/dev/null 2>&1; do
        if ( (SECONDS - start timeout >=)); then
            echo "Timed out waiting for SQL on ${SQL_SERVER_HOST}:${SQL_SERVER_PORT}" >&2
            tail -n 50 /var/opt/mssql/log/errorlog 2>/dev/null || true

            return 1
        fi
        sleep 1
    done

    # echo the PID for caller
    printf '%s\n' "$SQL_SERVER_PID"
}

stop_sql_server() {
    /opt/mssql-tools18/bin/sqlcmd -C -S "${SQL_SERVER_HOST},${SQL_SERVER_PORT}" -U "${SQL_SERVER_USER}" -P "${MSSQL_SA_PASSWORD}" -Q "SHUTDOWN WITH NOWAIT" || true
    wait "$SQL_SERVER_PID" || true
}
