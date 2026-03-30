---
skill: qr-authentication
category: architecture
source: SPOMARU
verified: true
---

# QR-Based Remote Authentication

## Problem

XR headsets have no keyboard. Users cannot type credentials.

## Solution

QR code displayed on XR device → user scans with mobile phone → server matches via short code → JWT issued to XR device.

## Flow

1. XR device calls `POST /api/auth/qr` → server generates UUID token + 4-char alphanumeric code
2. Code stored in Redis with 60-second TTL
3. XR device displays QR code on screen
4. User scans QR with phone → phone calls `POST /api/auth/remote-auth` with code + user credentials
5. Server validates code against Redis → Node.js EventEmitter emits auth event
6. XR device receives JWT token via EventEmitter callback (no polling)
7. JWT stored in Redis with session TTL (4-12 hours)

## Key Decisions

- **4-char code:** Human-readable fallback if QR scan fails (A-Z, 0-9)
- **EventEmitter:** Zero-latency in-process notification (no WebSocket or polling needed)
- **60-second TTL:** Prevents QR code replay attacks
- **Redis-backed:** Enables horizontal scaling (session not tied to process memory)
