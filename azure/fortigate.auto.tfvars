fortigate_api_token  = ""     # your fortigate api token
fortigate_ip_or_fqdn = ""     # your fortigate ip / fqdn
fortigate_interface  = "wan1" # the fortigate interface to use

tunnel_name_prefix     = "AZUREVPN" # tunnels are numbered AZUREVPN_1 by default AZURE only creates a single tunnel
tunnel_phase1_proposal = "aes256-sha1 3des-sha1 aes256-sha256"
tunnel_phase2_proposal = "aes256-sha1 3des-sha1 aes256-sha256"
