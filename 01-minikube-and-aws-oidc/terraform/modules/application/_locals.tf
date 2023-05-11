locals {
  entrypoint_script     = "${path.module}/files/entrypoint.sh"
  entrypoint_script_sha = filesha256(local.entrypoint_script)
  pod_name              = "${var.pod_name}-${substr(local.entrypoint_script_sha, 0, 7)}"
}
