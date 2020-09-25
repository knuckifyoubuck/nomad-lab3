job "postgres-nomad" {
  datacenters = ["dc1"]
  type = "service"
  group "postgres-group" {
    task "postgres" {
      driver = "docker"
      config {
        image = "dockersamples/examplevotingapp_postgres:before"
        dns_search_domains = ["service.dc1.consul"]
        dns_servers = ["172.17.0.1", "8.8.8.8"]
        port_map {
          http = 80
        }
      }
      service {
        name = "postgres"
        port = "http"
        check {
          name = "vote interface running on 80"
          interval = "10s"
          timeout  = "5s"
          type     = "http"
          protocol = "http"
          path     = "/"
        }
      }
      resources {
        cpu    = 500 # 500 MHz
        memory = 256 # 256MB
        network {
          port "http" {
             static = 5003
          }
        }
      }
    }
  }
}
