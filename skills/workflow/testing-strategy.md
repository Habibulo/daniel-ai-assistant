---
skill: testing-strategy
category: workflow
source: general
verified: true
date: 2026-04-01
---

Unit, integration, and e2e test patterns. Testing pyramid: many unit tests, fewer integration tests, minimal e2e tests. Unit tests for pure logic with no external dependencies. Integration tests hit real database (no mocks for data layer). E2e tests cover critical user flows only. Arrange-Act-Assert structure, descriptive test names that state the expected behavior, and test data factories over fixtures.
