job "nginx" {
  datacenters = ["dc1"]

  group "nginx" {
    count = 1

    task "nginx" {
      driver = "docker"

      config {
        image = "nginx:latest"
      }

      resources {
        cpu    = 500
        memory = 256
      }

      service {
        name = "nginx"
        port = "http"

        check {
          type     = "http"
          path     = "/"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }
  }
}

#Run this command: nomad job run nginx.nomad
