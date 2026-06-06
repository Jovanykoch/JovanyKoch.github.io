# Jovanykoch's Network Rule Sets & Surge Configurations

<a href="https://www.digitalocean.com/?refcode=eb602945d727&utm_campaign=Referral_Invite&utm_medium=Referral_Program&utm_source=badge"><img src="https://web-platforms.sfo2.cdn.digitaloceanspaces.com/WWW/Badge%201.svg" alt="DigitalOcean Referral Badge" /></a>

Production-ready self-hosted network rule sets and Surge configurations optimized for:

- Surge iOS
- WireGuard
- AI routing
- Smart DNS handling
- China direct routing
- Global proxy traffic split
- Self-hosted RULE-SET deployment

This repository provides categorized rule sets, proxy policies, and subscription-ready configurations designed for stability, performance, and maintainability.

---

# Features

## Smart Traffic Routing

- China Mainland traffic → DIRECT
- Global services → PROXY
- AI services → Dedicated AI policy group
- Apple services → DIRECT
- LAN / private network → DIRECT

---

## WireGuard Optimized

- WireGuard backbone support
- UDP priority enabled
- QUIC blocking support
- Mobile-network friendly
- IPv4 preferred routing

---

## Self-Hosted RULE-SET

Hosted using GitHub Pages / custom CDN.

Example:

```ini
RULE-SET,https://jkoch14.me/rules/China.list,DIRECT
```

Benefits:

- Faster updates
- Better cache control
- Easier maintenance
- Reduced third-party dependency

---

# Repository Structure

```txt
.
├── README.md
├── index.html
├── surge.conf
├── rules/
│   ├── Advertising.list
│   ├── Apple.list
│   ├── China.list
│   ├── GitHub.list
│   ├── Microsoft.list
│   ├── OpenAI.list
│   ├── Proxy.list
│   └── Direct.list
├── loon/
└── qx/
```

---

# Surge Subscription

## Main Configuration

```txt
https://jkoch14.me/surge.conf
```

Import directly into Surge iOS.

---

# Proxy Groups

```ini
Proxy = select, 🇭🇰 HK, 🇺🇸 US
AI = select, 🇺🇸 US, Proxy

🇭🇰 HK = url-test, policy-regex-filter=港|HK|Hong
🇺🇸 US = url-test, policy-regex-filter=美|US|States
```

---

# Routing Policy

```ini
RULE-SET,https://jkoch14.me/rules/Advertising.list,REJECT
RULE-SET,https://jkoch14.me/rules/China.list,DIRECT
RULE-SET,https://jkoch14.me/rules/Apple.list,DIRECT
RULE-SET,https://jkoch14.me/rules/OpenAI.list,AI
RULE-SET,https://jkoch14.me/rules/Microsoft.list,Proxy
RULE-SET,https://jkoch14.me/rules/GitHub.list,Proxy

GEOIP,CN,DIRECT
FINAL,Proxy,dns-failed
```

---

# DNS & Network Optimization

Current configuration includes:

```ini
dns-server = system,119.29.29.29,223.5.5.5

hijack-dns = 8.8.8.8:53,1.1.1.1:53

block-quic = all-proxy

udp-priority = true
```

Features:

- DNS hijack protection
- Public DNS interception
- UDP optimization
- QUIC control
- Better mobile network stability

---

# Supported Applications

## Surge

Primary supported platform.

- Surge iOS
- Surge Mac

---

## Loon

Rule-set compatible.

---

## Quantumult X

Partial compatibility depending on rule syntax.

---

# Rule Categories

| Rule File | Purpose | Typical Policy |
|---|---|---|
| Advertising.list | Ads / tracker blocking | REJECT |
| China.list | China Mainland domains | DIRECT |
| Apple.list | Apple services | DIRECT |
| OpenAI.list | OpenAI / ChatGPT | AI |
| Microsoft.list | Microsoft services | Proxy |
| GitHub.list | GitHub services | Proxy |
| Proxy.list | Common overseas services | Proxy |
| Direct.list | Direct routing domains | DIRECT |

---

# Security Notice

DO NOT publicly expose:

- WireGuard private keys
- Snell PSK
- VPS real IP addresses
- API passwords
- Endpoint credentials

Public repositories should only contain:

- Sanitized configurations
- Templates
- Example setups

---

# Recommended Deployment

Recommended architecture:

```txt
GitHub Repository
        ↓
GitHub Pages
        ↓
Custom Domain / CDN
        ↓
Surge RULE-SET Subscription
```

Optional:

- Cloudflare CDN
- jsDelivr cache
- Self-hosted VPS mirror

---

# Changelog

## 2026-05

- Added AI policy group
- Optimized DNS hijack
- Enabled QUIC blocking
- Improved WireGuard routing
- Reorganized RULE-SET structure

---

# Compatibility

Recommended environment:

- iOS 17+
- Surge iOS
- WireGuard backend
- IPv4 preferred

---

# Disclaimer

This repository is intended for:

- Personal use
- Research
- Learning
- Network management

Users are responsible for complying with all applicable laws, regulations, and service terms within their jurisdiction.

---