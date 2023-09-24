# Cadmus TGR API

Quick Docker image build:

```bash
docker build . -t vedph2020/cadmus-tgr-api:5.1.1 -t vedph2020/cadmus-tgr-api:latest
```

(replace with the current version).

This is a Cadmus API layer customized for the TGR project. Most of its code is derived from shared Cadmus libraries. See the [documentation](https://github.com/vedph/cadmus_doc/blob/master/api/creating.md) for more.

## History

- 2023-09-24: updated packages and added import controllers.

### 5.1.1

- 2023-09-19: updated packages.

### 5.1.0

- 2023-08-09:
  - updated packages (`MsLocation` added `p`).
  - added metadata part to the profile.

### 5.0.2

- 2023-07-20: refactored [logging](https://myrmex.github.io/overview/cadmus/dev/history/b-logging).

### 5.0.1

- 2023-07-17: added `doc-reference-types` thesaurus.
- 2023-07-16: updated packages.
- 2023-06-22: [moved to PostgreSQL](https://myrmex.github.io/overview/cadmus/dev/history/b-rdbms).

### 5.0.0

- 2023-06-07: updated packages (TGR core major version 5).
- 2023-05-19: updated packages and changed index/graph config in startup.
- 2023-05-12: updated packages.

### 3.0.1

- 2023-03-27: updated packages.
- 2023-03-07: updated packages.
- 2022-12-28: updated packages.
- 2022-11-27: updated packages.

### 3.0.0

- 2022-11-10: upgraded to NET 7.
- 2022-11-06: updated packages (refactored for nullability check).
- 2022-10-22: updated packages.
- 2022-10-10:
  - updated packages and changed `Startup.cs` injection for `IRepositoryProvider`.
  - more previews.
- 2022-10-05:
  - updated packages.
  - set HTTPS to optional in `Startup.cs` (new environment variables).
  - added factory to preview.

### 2.2.0

- 2022-08-18: enabled preview.

### 2.1.3

- 2022-08-18: updated packages.

### 2.1.2

- 2022-07-30: updated core packages (added `Note` to `QuotationParallel`).

### 2.1.1

- 2022-07-29: updated core package (added `Note` to VarQuotation`/`QuotationVariant`).
- 2022-07-22: updated packages.
- 2022-07-03: updated packages.
- 2022-06-10: updated packages.
- 2022-05-20: updated packages.

### 2.1.0

- 2022-04-29: upgraded to NET 6 core.

### 2.0.2

- 2022-04-24: added available witnesses layer.

### 2.0.1

- 2022-04-22: upgraded packages.

### 2.0.0

- 2022-02-14: upgraded packages.
- 2021-11-22: upgraded to refactored Cadmus API endpoints (removed the legacy database name).
- 2021-11-11 (v 2.0.0): upgraded to NET 6.
- 2021-10-15 (v 1.1.0): breaking changes: for auth database by AspNetCore.Identity.Mongo 8.3.1 (used since Cadmus.Api.Controllers 1.3.0, Cadmus.Api.Services 1.2.0):

```js
/*
Removed fields:
AuthenticatorKey = null
RecoveryCodes = []
*/
db.Users.updateMany({}, { $unset: {"AuthenticatorKey": 1, "RecoveryCodes": 1} });
```

See <https://github.com/vedph/cadmus_tgr> for model-related changes.
