---
skill: jwt-dual-auth
category: architecture
source: SPOMARU
verified: true
---

# Dual JWT Authentication System

## Two Separate Token Strategies

| Property | User Token | Admin Token |
|----------|-----------|-------------|
| Auth method | QR code scan | Username + password |
| Token type | Single JWT | Access + Refresh pair |
| Header | codereach-x-token | codereach-admin-x-token |
| Expiry | 4h (prod) / 12h (dev) | Access: 1h / Refresh: 1d |
| Storage | Redis (server-side) | Client-side (stateless) |
| Payload | seq, email, platform | seq, id, role |
| Revocation | Delete Redis entry | Token expiry only |
| Refresh | Re-authenticate via QR | Exchange refresh → new access |

## Why Separate

- Different security requirements (admin = higher privilege, shorter access window)
- Different client types (XR device vs web dashboard)
- Separate JWT secrets prevent cross-token forgery
- Separate headers prevent token confusion in middleware
