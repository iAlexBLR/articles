#!/usr/bin/env bash

set -e -o pipefail

unset DEFAULT_PROXY_PORT DEFAULT_OUTPUT_FOLDER PROXY_PORT OUTPUT_FOLDER

DEFAULT_PROXY_PORT=8001
DEFAULT_OUTPUT_FOLDER="/tmp/openid-config"

start_proxy() {
  local proxy_port
  proxy_port="${1}"

  kubectl proxy --port="${proxy_port}" &>/dev/null &
  echo "${!}"
}

stop_proxy() {
  local proxy_pid
  proxy_pid="${1}"

  kill -9 "${proxy_pid}" &>/dev/null
}

get_proxy_status() {
  local proxy_url
  proxy_url="${1}"

  curl --write-out '%{http_code}' -s -o /dev/null "${proxy_url}/readyz"
}

wait_proxy() {
  local proxy_url deplay
  proxy_url="${1}"
  deplay="1"

  while [[ $(get_proxy_status "${proxy_url}") != 200 ]];
  do
    echo "[PROXY] Server has not started yet. Waiting..."
    sleep "${deplay}"
  done
  echo "[PROXY] Server has started and ready."
}

get_api_info() {
  local proxy_url url_path
  proxy_url="${1}"
  url_path="${2}"

  curl -s "${proxy_url}/${url_path}" | jq
}

dump_openid_config() {
  local output_folder proxy_url config_path output_file
  output_folder="${1}"
  proxy_url="${2}"
  config_path="${3}"
  output_file="${output_folder}/${config_path}"

  mkdir -p "$(dirname "${output_file}")"
  get_api_info "${proxy_url}" "${config_path}" > "${output_file}"
  echo "[OUTPUT] Config \"${config_path}\" was sucessfully saved."
}

main(){
  local proxy_port output_folder proxy_url proxy_pid
  proxy_port="${1}"
  output_folder="${2}"
  proxy_url="http://localhost:${proxy_port}"

  echo "[PROXY] Starting server on ${proxy_port} port."
  proxy_pid=$(start_proxy "${proxy_port}")
  wait_proxy "${proxy_url}"

  echo "[OUTPUT] Folder is set to '${output_folder}'."
  dump_openid_config "${output_folder}" "${proxy_url}" ".well-known/openid-configuration"
  dump_openid_config "${output_folder}" "${proxy_url}" "openid/v1/jwks"

  stop_proxy "${proxy_pid}"
  echo "[PROXY] Server has stopped."
}

PROXY_PORT="${1:-$DEFAULT_PROXY_PORT}"
OUTPUT_FOLDER="${2:-$DEFAULT_OUTPUT_FOLDER}"

main "${PROXY_PORT}" "${OUTPUT_FOLDER}"
