# Template for initial configuration bash script
data "local_file" "init" {
  filename = "${path.module}/init.json"
}
