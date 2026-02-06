resource "proxmox_virtual_environment_vm" "example" {
  name      = "tf-test-01"
  node_name = "proxmox"
  pool_id   = "terraform-vms"

  clone {
    vm_id = 9000 # template VMID
  }

  cpu {
    cores = 2
  }

  memory {
    dedicated = 2048
  }

  network_device {
    bridge = "vmbr0"
  }

  initialization {
    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }

    user_account {
      username = "debian"
      ssh_keys = [file("~/.ssh/id_rsa.pub")]
    }
  }
}
