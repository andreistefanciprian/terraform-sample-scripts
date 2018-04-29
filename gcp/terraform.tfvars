region1         = "europe-west4"
region1_zone_1  = "europe-west4-a"
region1_zone_2  = "europe-west4-b"
region2         = "europe-west3"
region2_zone_1  = "europe-west3-a"
region2_zone_2  = "europe-west3-b"
gcp_project     = "cedar-card-200213"
credentials     = "~/terraform-account.json"
name            = "dev"
os_image        = "ubuntu-1404-lts"
regions         = [ "europe-west4", "europe-west3" ]
subnet_cidr     = {
    "0" = "192.168.101.0/24"
    "1" = "192.168.102.0/24"
    "2" = "192.168.103.0/24"
    "3" = "192.168.104.0/24"
  }
