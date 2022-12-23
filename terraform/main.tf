terraform {
  cloud {
    organization = "xfix-pw"
    workspaces {
      name = "production"
    }
  }

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "3.30.0"
    }
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.36.1"
    }
    gandi = {
      source  = "go-gandi/gandi"
      version = "2.2.1"
    }
  }
}

resource "hcloud_server" "xfix-pw" {
  name         = "xfix.pw"
  image        = "ubuntu-20.04"
  server_type  = "cpx11"
  firewall_ids = [hcloud_firewall.firewall.id]
}

resource "hcloud_firewall" "firewall" {
  name = "firewall"
  rule {
    direction  = "in"
    protocol   = "icmp"
    source_ips = ["0.0.0.0/0"]
  }
  dynamic "rule" {
    for_each = [22, 25, 80, 443, 4242]
    content {
      direction  = "in"
      protocol   = "tcp"
      port       = rule.value
      source_ips = ["0.0.0.0/0"]
    }
  }
}

resource "gandi_livedns_record" "dns_record" {
  for_each = toset(["@", "www"])
  name     = each.key
  zone     = "borowski.pw"
  ttl      = 1800
  type     = "A"
  values   = [hcloud_server.xfix-pw.ipv4_address]
}

resource "cloudflare_zone" "xfix-pw" {
  zone = "xfix.pw"
}

resource "cloudflare_record" "xfix-pw" {
  zone_id = cloudflare_zone.xfix-pw.id
  name    = "xfix.pw"
  type    = "A"
  value   = hcloud_server.xfix-pw.ipv4_address
}

resource "cloudflare_zone" "pastebin-run" {
  zone = "pastebin.run"
}

resource "cloudflare_record" "pastebin-run" {
  for_each = toset(["pastebin.run", "www"])
  zone_id  = cloudflare_zone.pastebin-run.id
  name     = each.key
  type     = "A"
  value    = hcloud_server.xfix-pw.ipv4_address
}
