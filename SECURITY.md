# Security policy

## Supported versions

| Version | Supported |
|---|---|
| `main` (latest) | Yes |

We release via GitHub tags (semantic-release, `npmPublish: false`). Update to latest `main`/tag.

## Reporting a vulnerability

- Open a private security advisory on GitHub or email the maintainer.
- Do not open a public issue for sensitive vulnerabilities.
- We will respond promptly, fix, and release a new tag.

## Secrets

Never commit secrets (`.env`, tokens). See `.env.example` with `YOUR_` placeholders; `.env.local` is gitignored.
