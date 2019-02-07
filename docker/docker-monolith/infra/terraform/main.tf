provider "docker" {}

resource "docker_image" "otus_reddit" {
  name = "kornsn/otus-reddit:1.0"
}

resource "docker_container" "otus_reddit" {
  count = "${var.instances_amount}"
  image = "${docker_image.otus_reddit.latest}"
  name  = "otus_reddit-${count.index}"

  // we have to open ports and configure load balancing,
  // but we will not do it, because first we have to separate
  // application and database.
}
