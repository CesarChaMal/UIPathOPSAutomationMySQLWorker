provider "mysql" {
  endpoint = "127.0.0.1:3306" # the "external" port
  username = "root"
  /*password = "$random_password.mysql_root_password.result"*/
  password = "mysql"
}

resource "mysql_database" "db" {
  name = "db"
}

provider "docker" {
  version = "~> 2.7"
  host    = "npipe:////.//pipe//docker_engine"
}
