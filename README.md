# Phishing IOC Collector

⚠️ Disclaimer
This tool is for defensive security research only.
Never analyze live phishing emails on production systems
Always use isolated VMs for malware/IOC analysis
Do not share real phishing samples or malicious URLs publicly

A bash-based toolkit for extracting and analyzing **Indicators of Compromise (IOCs)** from phishing emails (`.eml` format).  
This script automates the collection of:
- URLs & redirect chains
- Domains & IPs
- TLS certificates (SAN fields, fingerprints)
- ASN ownership details
- SHA256 hashes (to cluster phishing kits)
- Technology stack detection (`whatweb`)

It produces a **portable IOC bundle** (`ioc_bundle.zip`) for further analysis or sharing.

---

## 🚀 Features
- Extracts URLs from phishing emails
- Follows redirects and captures final destinations
- Collects domain/IP/ASN details
- Extracts TLS certificates and SAN fields
- Generates SHA256 hashes of page bodies
- Identifies technology stack (via [WhatWeb](https://github.com/urbanadventurer/WhatWeb))
- Bundles everything into a `.zip` for reporting/sharing

---

## 📂 Output Files
The script creates an `ioc_bundle.zip` with:
- `urls.txt` – all extracted URLs  
- `urls_in_pages.txt` – URLs found inside HTML pages  
- `domains_from_tls.txt` – SAN domains from TLS certs  
- `host_ip_asn.csv` – IP → ASN ownership mapping  
- `page_hashes.txt` – SHA256 fingerprints  
- `certs_readable.txt` – TLS certificate details  
- `tech_stack_top.txt` – Most common technologies  
- `SUMMARY.txt` – IOC summary  

---

## ⚡ Usage
```bash
# Clone repo
git clone https://github.com/rorrcyber/phishing-ioc-collector.git
cd phishing-ioc-collector

# Make script executable
chmod +x phishing_ioc_collector.sh

# Run on a phishing email
./phishing_ioc_collector.sh ~/phish/IN/phish.eml
