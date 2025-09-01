# Phishing IOC Collector

A bash-based toolkit for extracting and analyzing **Indicators of Compromise (IOCs)** from phishing emails (`.eml` format).  
The script automates collection of URLs, domains, IPs, TLS certificates, ASN ownership, and creates a **portable IOC bundle** for further analysis or sharing.

## ⚠️ Important Notes
- This tool is for **defensive security research only**
- Never analyze live phishing emails on production systems
- Use isolated VMs for all analysis work
- Do not share actual phishing emails or live malicious URLs publicly

---

## 🚀 Features
- Extracts URLs from phishing emails
- Follows redirect chains and captures final destinations
- Collects domain/IP/ASN details
- Extracts TLS certificates and SAN fields
- Generates unique page **SHA256 hashes** (to cluster phishing kits)
- Identifies technology stack (via [`whatweb`](https://github.com/urbanadventurer/WhatWeb))
- Creates a **zip bundle** with all artifacts for easy sharing
- Outputs a concise **SUMMARY.txt** with stats

---

## 📂 Output Files
The script produces a bundle (`ioc_bundle.zip`) containing:

- `urls.txt` → all extracted URLs  
- `urls_in_pages.txt` → URLs found inside HTML pages  
- `domains_from_tls.txt` → SAN domains from TLS certs  
- `host_ip_asn.csv` → IP → ASN ownership mapping  
- `page_hashes.txt` → SHA256 fingerprints of phishing kits  
- `certs_readable.txt` → readable TLS certificate details  
- `tech_stack_top.txt` → most common technologies detected  
- `SUMMARY.txt` → IOC summary report  

---

## 🔧 Dependencies
Make sure you have the following tools installed on your system:

```bash
sudo apt update && sudo apt install -y \
  ripmime whois curl jq dnsutils openssl whatweb unzip
"Add initial README"
