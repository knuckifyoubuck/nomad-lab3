bind_addr = "0.0.0.0"
data_dir  = "/var/lib/nomad"
server {
  enabled          = true
  bootstrap_expect = 1
}
client {
  enabled       = true
  network_speed = 100
} 
