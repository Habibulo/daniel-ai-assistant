---
skill: jwt-token-management
category: security
source: SPOMARU
verified: true
---

# JWT Token Management

## Issuance

- User: JWT issued after QR auth flow completes. Payload: `{ seq, email, login_platform }`.
- Admin: JWT pair (access + refresh) issued after password verification. Payload: `{ seq, id, role }`.

## Storage & Revocation

- User tokens stored in Redis with TTL. Logout = delete Redis key = immediate revocation.
- Admin tokens are stateless. Revocation = wait for expiry.

## Rotation (Admin)

1. Access token expires (1h)
2. Client sends expired access + valid refresh to exchange endpoint
3. Server verifies refresh token → issues new access token
4. If refresh expired (1d) → full re-login required (error 1008)

## Security Measures

- Custom header keys (not Authorization) — reduces accidental leakage
- Separate JWT secrets per token type (user vs admin, access vs refresh)
- Redis TTL auto-expires tokens — no stale sessions
- Different expiry per environment (shorter in prod)
