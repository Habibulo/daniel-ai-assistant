---
expertise: password-hashing
category: security
source: SPOMARU
verified: true
---

# Password Hashing

## Implementation

- **PBKDF2** with random salt per admin account (pbkdf2-password library)
- **bcrypt** as secondary option (cost factor 10)
- Salt stored alongside hash in admin table (crlauncher_log database)

## Storage Schema

```
admin table:
  - password: varchar (PBKDF2 derived key)
  - salt: varchar (random per-account salt)
```

## Verification Flow

1. Receive plaintext password from login request
2. Retrieve stored hash + salt from admin table
3. Run PBKDF2 with input password + stored salt
4. Compare derived key with stored hash
5. Match → issue JWT pair. No match → error 1007 (ADMIN_AUTH_FAILED)
