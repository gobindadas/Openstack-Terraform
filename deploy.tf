/*
resource "openstack_compute_instance_v2" "my_instance" {
  name = "my_instance"
  availability_zone = "nova"
  region = "RegionOne"
  image_id = "2fa6ae1f-dc32-4c2a-a9c1-ae878924442a"
  flavor_name = "m1.tiny"
  key_pair = "test"

  network {
    uuid = "5ae0cf8e-d4c3-4fb2-89a3-c9d957be6e3e"
  }
}*/
