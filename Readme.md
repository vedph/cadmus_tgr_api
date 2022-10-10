# Cadmus TGR API

Quick Docker image build:

```bash
docker build . -t vedph2020/cadmus_tgr_api:2.2.0 -t vedph2020/cadmus_tgr_api:latest
```

(replace with the current version).

This is a Cadmus API layer customized for the TGR project. Most of its code is derived from shared Cadmus libraries. See the [documentation](https://github.com/vedph/cadmus_doc/blob/master/api/creating.md) for more.

## History

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
