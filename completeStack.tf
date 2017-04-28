resource "openstack_networking_network_v2" "ericsson_network" {
  name = "ericsson_network"
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "ericsson_subnet1" {
  name = "ericsson_subnet1"
  network_id = "${openstack_networking_network_v2.ericsson_network.id}"
  cidr = "192.168.104.0/24"
  ip_version = 4
}
 resource "openstack_compute_secgroup_v2" "ericsson_sg1" {
   name = "ericsson_sg1"
   description = "Ericsson SG1"
   rule{
     from_port = 22
     to_port = 22
     ip_protocol = "tcp"
     cidr = "192.168.104.0/24"
   }
 }
resource "openstack_networking_port_v2" "port1"{
  name = "port1"
  network_id = "${openstack_networking_network_v2.ericsson_network.id}"
  admin_state_up = "true"
  //security_group_ids = ["${openstack_compute_secgroup_v2.ericsson_sg1.id}}"]

  fixed_ip{
    subnet_id = "${openstack_networking_subnet_v2.ericsson_subnet1.id}"
    ip_address = ""
  }
}

resource "openstack_blockstorage_volume_v1" "volume1" {
  name = "volume1"
  size = 1
}

resource "openstack_compute_floatingip_v2" "floating_ip1" {
  pool = "provider"
}

resource "openstack_compute_instance_v2" "ericsson_vm1"{
  name = "ericsson_vm1"
  availability_zone = "nova"
  region = "RegionOne"
  image_id = "2fa6ae1f-dc32-4c2a-a9c1-ae878924442a"
  flavor_name = "m1.tiny"
  key_pair = "test"
  security_groups = ["${openstack_compute_secgroup_v2.ericsson_sg1.name}"]
  floating_ip = "${openstack_compute_floatingip_v2.floating_ip1.fixed_ip}"
  network{
    port = "${openstack_networking_port_v2.port1.id}"
  }
}
 resource "openstack_compute_volume_attach_v2" "volume_attach1"{
   instance_id = "${openstack_compute_instance_v2.ericsson_vm1.id}"
   volume_id = "${openstack_blockstorage_volume_v1.volume1.id}"
 }