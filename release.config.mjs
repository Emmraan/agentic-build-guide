// semantic-release — GitHub tags only, no npm (L18)
export default {
  branches: ["main"],
  plugins: [
    ["@semantic-release/commit-analyzer", { preset: "conventionalcommits", releaseRules: [{ type: "docs", release: false }, { type: "feat", release: "minor" }, { type: "fix", release: "patch" }, { type: "chore", release: false }, { type: "refactor", release: false }] }],
    "@semantic-release/release-notes-generator",
    "@semantic-release/changelog",
    ["@semantic-release/github", { successComment: false, failComment: false }],
    ["@semantic-release/git", { assets: ["CHANGELOG.md"], message: "chore(release): ${nextRelease.version} [skip ci]\n\n${nextRelease.notes}" }],
  ],
};
