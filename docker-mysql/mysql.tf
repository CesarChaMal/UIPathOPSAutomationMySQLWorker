resource "docker_image" "mysql" {
  name = "mysql:8"
}

resource "random_password" "mysql_root_password" {
  length = 16
}

resource "docker_container" "mysql" {
  name = "mysql"
  image = "${docker_image.mysql.latest}"
  env = [
    "MYSQL_ROOT_PASSWORD=mysql"
  ]  
  volumes {
    volume_name    = "mysql-vol"
    container_path = "/var/lib/mysql"
  }
  ports {
    internal = 3306
    external = 3306
  }
}

