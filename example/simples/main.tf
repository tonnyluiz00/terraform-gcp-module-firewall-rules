provider "google" {
  #credentials = file("key.json")
  project = "curso-terraform-tonny"
  region  = "us-central1"
  zone    = "us-central1-c"
}


module "firewall_rules" {
  source  = "tonnyluiz00/module-firewall-rules/gcp"

  firewall_rules = {
    rule1 = {
      description = "Allow HTTP and HTTPS traffic"
      allow = [
        {
          protocol = "tcp"
          ports    = ["80", "443"]
        }
      ]
      source_ranges = ["1.1.1.1/32", "2.2.2.2/32"]
      target_tags   = ["web"]
  
    }
    rule2 = {
      description = "Allow SSH traffic"
      allow = [
        {
          protocol = "tcp"
          ports    = ["22"]
        }
      ]
      source_ranges = ["1.1.1.1/32", "2.2.2.2/32"]
      target_tags   = ["ssh"]
    }
  }
}