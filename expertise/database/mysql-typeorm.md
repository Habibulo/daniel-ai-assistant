---
expertise: mysql-typeorm
category: database
source: SPOMARU
verified: true
---

# MySQL with TypeORM EntitySchema

## Configuration

- **TypeORM 0.3.12** with EntitySchema (schema-first, no decorators)
- **Driver:** mysql2 (binary protocol)
- **Naming:** SnakeNamingStrategy — camelCase JS properties → snake_case DB columns
- **IDs:** BigInt Unsigned auto-increment
- **Timestamps:** DEFAULT CURRENT_TIMESTAMP
- **Synchronize:** true (auto-creates tables from schemas)

## EntitySchema Pattern

```javascript
const UserAccount = new EntitySchema({
  name: "UserAccount",
  tableName: "user_account",
  columns: {
    seq: { type: "bigint", unsigned: true, primary: true, generated: "increment" },
    email: { type: "varchar", length: 255 },
    createdAt: { type: "timestamp", default: () => "CURRENT_TIMESTAMP" },
  },
});
```

## Multi-DataSource

Three separate DataSource instances, each connecting to a different database:
- `dataSource('data')` → crlauncher_data
- `dataSource('log')` → crlauncher_log
- `dataSource('user')` → crlauncher_user

## Repository Usage

```javascript
const repo = dataSource('user').getRepository(UserAccount);
const user = await repo.findOne({ where: { email } });
```
