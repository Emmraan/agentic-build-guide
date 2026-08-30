# References - latest info source (reference > dump)

> All versions/links here are references only. Agent must `web-fetch` live before building (L11/L24). Do not dump content into ABG; Renovate keeps pins current.

## Skills & guide

- `Emmraan/agent-skills` - https://github.com/Emmraan/agent-skills (160+ skills, via `using-agent-skills` + `find-skills`)
- This guide - `AGENTIC_BUILD_GUIDE.md` (core ~800 tok)

## Runtime & package

- Node LTS - https://nodejs.org/en/about/previous-releases + https://github.com/nodejs/node
- pnpm - https://pnpm.io/installation + https://github.com/pnpm/pnpm
- NVM - https://github.com/nvm-sh/nvm

## Frameworks

- Next.js - https://nextjs.org/docs
- React - https://react.dev
- TypeScript - https://www.typescriptlang.org/docs
- Tailwind CSS - https://tailwindcss.com/docs
- Prisma - https://www.prisma.io/docs
- Vercel AI SDK - https://sdk.vercel.ai/docs

## Git & CI

- GitHub Branch Protection (Classic) - https://docs.github.com/en/rest/branches/branch-protection
- GitHub Rulesets - https://docs.github.com/en/rest/rules/rulesets + https://docs.github.com/en/repositories/configuring-branches-and-merges/managing-a-branch-protection-rule
- GitHub Actions Checkout - https://github.com/actions/checkout
- pnpm Action Setup - https://github.com/pnpm/action-setup
- Setup Node - https://github.com/actions/setup-node
- GitHub App Token - https://github.com/tibdex/github-app-token
- semantic-release - https://semantic-release.gitbook.io/
- Renovate - https://docs.renovatebot.com/

## Docker & infra

- Docker Docs (multi-stage, distroless) - https://docs.docker.com/build/building/multi-stage/
- Docker Metadata Action - https://github.com/docker/metadata-action
- Docker Build Push Action - https://github.com/docker/build-push-action
- GHCR - https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry
- AWS ECR - https://docs.aws.amazon.com/AmazonECR/latest/userguide/what-is-ecr.html
- GCP GCR/Artifact Registry - https://cloud.google.com/artifact-registry/docs
- Azure ACR - https://learn.microsoft.com/en-us/azure/container-registry/

## IaC & K8s

- Terraform - https://developer.hashicorp.com/terraform/docs + https://github.com/hashicorp/setup-terraform
- AWS Terraform Provider - https://registry.terraform.io/providers/hashicorp/aws/latest/docs
- GCP Provider - https://registry.terraform.io/providers/hashicorp/google/latest/docs
- Azure Provider - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs
- ArgoCD - https://argo-cd.readthedocs.io/
- Flux - https://fluxcd.io/flux/
- Helm - https://helm.sh/docs/

## Quality & markdown

- Contributor Covenant - https://www.contributor-covenant.org/version/2/1/code_of_conduct/
- GitHub Community Templates - https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions
- Keep a Changelog - https://keepachangelog.com/
- Conventional Commits - https://www.conventionalcommits.org/

## Token & graph (optional resources)

- token-saver - https://github.com/ppgranger/token-saver
- graphify - https://github.com/Graphify-Labs/graphify
- claude-mem - https://github.com/thedotmack/claude-mem

---
Agent: before any phase/task, `web-fetch` relevant link above + `find-skills` (L11). Renovate updates pinned versions in `.github/workflows/*.yml` automatically.
