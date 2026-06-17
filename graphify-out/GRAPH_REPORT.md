# Graph Report - .  (2026-06-17)

## Corpus Check
- Corpus is ~31,456 words - fits in a single context window. You may not need a graph.

## Summary
- 703 nodes · 741 edges · 41 communities (35 shown, 6 thin omitted)
- Extraction: 98% EXTRACTED · 2% INFERRED · 0% AMBIGUOUS · INFERRED: 15 edges (avg confidence: 0.78)
- Token cost: 132,835 input · 19,924 output

## Community Hubs (Navigation)
- [[_COMMUNITY_Agentic Principles & Context|Agentic Principles & Context]]
- [[_COMMUNITY_Agentic Audit Findings|Agentic Audit Findings]]
- [[_COMMUNITY_Architecture Audit Detail|Architecture Audit Detail]]
- [[_COMMUNITY_Biome Lint & Format Config|Biome Lint & Format Config]]
- [[_COMMUNITY_Dev Dependencies & Tooling|Dev Dependencies & Tooling]]
- [[_COMMUNITY_Package Manifest & Scripts|Package Manifest & Scripts]]
- [[_COMMUNITY_Security Headers & CSP|Security Headers & CSP]]
- [[_COMMUNITY_Agentic Settings Hygiene|Agentic Settings Hygiene]]
- [[_COMMUNITY_Security & CI Gate Reports|Security & CI Gate Reports]]
- [[_COMMUNITY_Audit Metadata & Thresholds|Audit Metadata & Thresholds]]
- [[_COMMUNITY_Test Coverage & Flakiness|Test Coverage & Flakiness]]
- [[_COMMUNITY_Testing Audit Metadata|Testing Audit Metadata]]
- [[_COMMUNITY_TypeScript Config|TypeScript Config]]
- [[_COMMUNITY_Quality-Gate Lifecycle Findings|Quality-Gate Lifecycle Findings]]
- [[_COMMUNITY_Agentic Audit Metadata|Agentic Audit Metadata]]
- [[_COMMUNITY_Security Audit Domains|Security Audit Domains]]
- [[_COMMUNITY_Architecture Audit Summary|Architecture Audit Summary]]
- [[_COMMUNITY_Security Audit Metadata|Security Audit Metadata]]
- [[_COMMUNITY_Testing Audit Summary|Testing Audit Summary]]
- [[_COMMUNITY_Testing Audit Findings|Testing Audit Findings]]
- [[_COMMUNITY_Security Audit Findings|Security Audit Findings]]
- [[_COMMUNITY_Quality-Gates Audit Metadata|Quality-Gates Audit Metadata]]
- [[_COMMUNITY_Testing Query-Priority Metrics|Testing Query-Priority Metrics]]
- [[_COMMUNITY_Threshold-Counter Feature|Threshold-Counter Feature]]
- [[_COMMUNITY_Lighthouse CI Config|Lighthouse CI Config]]
- [[_COMMUNITY_Claude Settings & Permissions|Claude Settings & Permissions]]
- [[_COMMUNITY_Agentic Audit Report|Agentic Audit Report]]
- [[_COMMUNITY_Testing Audit Report|Testing Audit Report]]
- [[_COMMUNITY_Architecture Audit Report|Architecture Audit Report]]
- [[_COMMUNITY_Agentic Toolkit Setup Script|Agentic Toolkit Setup Script]]
- [[_COMMUNITY_Verify-Gates Script|Verify-Gates Script]]
- [[_COMMUNITY_Commitlint Config|Commitlint Config]]
- [[_COMMUNITY_Gate-Bypass Guard Hook|Gate-Bypass Guard Hook]]
- [[_COMMUNITY_Jest Config|Jest Config]]
- [[_COMMUNITY_Playwright Config|Playwright Config]]
- [[_COMMUNITY_Fallow Audit Script|Fallow Audit Script]]

## God Nodes (most connected - your core abstractions)
1. `compilerOptions` - 21 edges
2. `scripts` - 20 edges
3. `snapshot` - 17 edges
4. `snapshot` - 16 edges
5. `snapshot` - 15 edges
6. `Definition of Done` - 13 edges
7. `snapshot` - 12 edges
8. `Feature-Folder Architecture` - 11 edges
9. `.agents Single Source of Truth` - 10 edges
10. `Quality Gate` - 9 edges

## Surprising Connections (you probably didn't know these)
- `Missing Staged-Content Secret Scan` --semantically_similar_to--> `CI Security Audit Job (pnpm audit + gitleaks)`  [INFERRED] [semantically similar]
  .architect-audits/quality-gates-audit/findings.md → .github/workflows/ci.yml
- `index.html Root Mount Point` --references--> `Feature-Folder Architecture`  [INFERRED]
  index.html → .agents/project/ARCHITECTURE.md
- `tmp >=0.2.6 Transitive Advisory Override` --conceptually_related_to--> `CI Security Audit Job (pnpm audit + gitleaks)`  [INFERRED]
  pnpm-workspace.yaml → .github/workflows/ci.yml
- `block-gate-bypass PreToolUse Hook` --conceptually_related_to--> `Quality Gate`  [EXTRACTED]
  CLAUDE.md → .agents/decisions/0002-quality-gates-as-code.md
- `Security Policy` --conceptually_related_to--> `Quality Gate`  [INFERRED]
  SECURITY.md → .agents/decisions/0002-quality-gates-as-code.md

## Import Cycles
- None detected.

## Hyperedges (group relationships)
- **Four Pillars of Agentic Engineering** — decisions_0003_behaviour_map, decisions_0002_quality_gate, agents_readme_single_source_of_truth, run_e2e_tests_skill_run_e2e_tests [EXTRACTED 1.00]
- **Quality Gate Suite (pnpm verify)** — project_tech_stack_biome, project_tech_stack_fallow, decisions_0002_pnpm_verify, project_definition_of_done_coverage_threshold [EXTRACTED 0.85]
- **Agent Context Entry Points** — agents_agents_operating_contract, claude_claude_md, agents_readme_single_source_of_truth [EXTRACTED 1.00]
- **CI Workflow Jobs Pipeline** — workflows_ci_quality_job, workflows_ci_fallow_job, workflows_ci_test_job, workflows_ci_build_job, workflows_ci_e2e_job, workflows_ci_security_job [EXTRACTED 1.00]
- **Three-Stage Quality Gate Baseline** — quality_gates_audit_findings_precommit_stage, quality_gates_audit_findings_prepush_stage, quality_gates_audit_findings_ci_stage [EXTRACTED 1.00]
- **Security Repo-Hardening Gaps** — security_audit_findings_content_security_policy_missing, security_audit_findings_security_headers_missing, security_audit_findings_sast_codeql_missing, security_audit_findings_dependabot_missing [INFERRED 0.75]

## Communities (41 total, 6 thin omitted)

### Community 0 - "Agentic Principles & Context"
Cohesion: 0.08
Nodes (51): The Golden Rules, AGENTS.md Operating Contract, Follow the Templates, Read Before You Write Contract, .agents Single Source of Truth, block-gate-bypass PreToolUse Hook, CLAUDE.md Claude-Specific Layer, Architecture Decision Record (ADR) (+43 more)

### Community 1 - "Agentic Audit Findings"
Cohesion: 0.05
Nodes (36): aiSurfaceDetected, checks, missing, partial, present, violation, gitCommit, mode (+28 more)

### Community 2 - "Architecture Audit Detail"
Cohesion: 0.06
Nodes (35): checks, average, deepest, framework, gitCommit, mode, noGraphify, pattern (+27 more)

### Community 3 - "Biome Lint & Format Config"
Cohesion: 0.06
Nodes (34): noUnusedImports, noUnusedVariables, files, ignore, ignoreUnknown, formatter, enabled, indentStyle (+26 more)

### Community 4 - "Dev Dependencies & Tooling"
Cohesion: 0.06
Nodes (32): devDependencies, @axe-core/playwright, @biomejs/biome, @commitlint/cli, @commitlint/config-conventional, @commitlint/types, fallow, husky (+24 more)

### Community 5 - "Package Manifest & Scripts"
Cohesion: 0.06
Nodes (31): dependencies, react, react-dom, description, engines, node, name, packageManager (+23 more)

### Community 6 - "Security Headers & CSP"
Cohesion: 0.07
Nodes (30): detected, directives, source, present, present, permissionsPolicy, referrerPolicy, strictTransportSecurity (+22 more)

### Community 7 - "Agentic Settings Hygiene"
Cohesion: 0.07
Nodes (29): Notification, PostToolUse, PreToolUse, Stop, aider, copilot, cursorRulesDirectory, cursorrulesLegacy (+21 more)

### Community 8 - "Security & CI Gate Reports"
Cohesion: 0.08
Nodes (29): Dependabot Configuration, Dependabot github-actions Ecosystem Update, Dependabot npm Ecosystem Update, pnpm Workspace Configuration, tmp >=0.2.6 Transitive Advisory Override, Continuous Integration Quality Gate Stage, Pre-commit Quality Gate Stage, Pre-push Quality Gate Stage (+21 more)

### Community 9 - "Audit Metadata & Thresholds"
Cohesion: 0.07
Nodes (27): filtersApplied, exclude, include, layers, framework, gitCommit, graphifyRevision, mode (+19 more)

### Community 10 - "Test Coverage & Flakiness"
Cohesion: 0.07
Nodes (27): branches, collectCoverageFromExcludes, functions, lines, source, statements, fixedWaits, orderingDependent (+19 more)

### Community 11 - "Testing Audit Metadata"
Cohesion: 0.07
Nodes (26): appliedFilters, exclude, include, componentTestingLibrary, endToEndFramework, graphifyRevision, lintStack, mode (+18 more)

### Community 12 - "TypeScript Config"
Cohesion: 0.09
Nodes (25): compilerOptions, esModuleInterop, isolatedModules, jsx, lib, module, moduleDetection, moduleResolution (+17 more)

### Community 13 - "Quality-Gate Lifecycle Findings"
Cohesion: 0.08
Nodes (24): misconfigured, missing, present, ecosystem, gates, gitCommit, graphifyRevision, hookRunner (+16 more)

### Community 14 - "Agentic Audit Metadata"
Cohesion: 0.08
Nodes (23): aiSurfaceDetected, detectedAgenticInstructionFiles, gitCommit, graphifyRevision, mode, noGraphify, outputs, projectShape (+15 more)

### Community 15 - "Security Audit Domains"
Cohesion: 0.08
Nodes (24): missing, notApplicable, partial, present, violation, missing, partial, present (+16 more)

### Community 16 - "Architecture Audit Summary"
Cohesion: 0.10
Nodes (21): missing, partial, present, violation, missing, partial, present, violation (+13 more)

### Community 17 - "Security Audit Metadata"
Cohesion: 0.10
Nodes (20): appliedFilters, exclude, include, authLibrary, deploymentPlatform, framework, gitCommit, graphifyNote (+12 more)

### Community 18 - "Testing Audit Summary"
Cohesion: 0.10
Nodes (21): missing, partial, present, violation, missing, partial, present, violation (+13 more)

### Community 19 - "Testing Audit Findings"
Cohesion: 0.11
Nodes (18): checks, endToEndFramework, graphifyRevision, noGraphify, repository, runFinishedAt, runStartedAt, skillVersion (+10 more)

### Community 20 - "Security Audit Findings"
Cohesion: 0.11
Nodes (17): authLibrary, checks, deploymentPlatform, framework, gitCommit, graphifyNote, noGraphify, repository (+9 more)

### Community 21 - "Quality-Gates Audit Metadata"
Cohesion: 0.12
Nodes (16): ecosystem, filtersApplied, exclude, include, stages, gitCommit, graphifyRevision, hookRunner (+8 more)

### Community 22 - "Testing Query-Priority Metrics"
Cohesion: 0.12
Nodes (16): byDisplayValue, byLabelText, byPlaceholderText, byRole, byText, ratio, byTestId, ratio (+8 more)

### Community 23 - "Threshold-Counter Feature"
Cohesion: 0.22
Nodes (7): App(), rootElement, ThresholdCounter(), statusForCount(), ThresholdLevel, ThresholdStatus, useThresholdCounter

### Community 24 - "Lighthouse CI Config"
Cohesion: 0.14
Nodes (13): assertions, categories:accessibility, categories:best-practices, categories:performance, categories:seo, ci, assert, collect (+5 more)

### Community 25 - "Claude Settings & Permissions"
Cohesion: 0.29
Nodes (6): hooks, PreToolUse, permissions, allow, deny, $schema

### Community 26 - "Agentic Audit Report"
Cohesion: 0.40
Nodes (6): block-gate-bypass.sh PreToolUse Hook, Claude Code settings.json Permissions and Hooks, No-Abbreviations Policy Self-Compliance Drift (Partial), Agentic Audit Report, settings.local.json Not Gitignored (Violation), Agentic Audit Snapshot

### Community 27 - "Testing Audit Report"
Cohesion: 0.40
Nodes (6): Coverage Threshold Over Narrowed Surface (Partial), getByTestId Over Ceiling (Violation), Query Priority and Selector Hygiene, Testing Audit Report, statusForCount Pure Rule Untested, Testing Audit Snapshot

### Community 28 - "Architecture Audit Report"
Cohesion: 0.50
Nodes (5): Feature-Folders Architectural Pattern, noGraphify Static-Only Caveat, Undocumented Public-API Barrel (Partial), Architecture Audit Report, Architecture Audit Snapshot

### Community 29 - "Agentic Toolkit Setup Script"
Cohesion: 0.70
Nodes (4): bold(), note(), ok(), setup-agentic-toolkit.sh script

## Knowledge Gaps
- **492 isolated node(s):** `skillVersion`, `runStartedAt`, `runFinishedAt`, `repository`, `gitCommit` (+487 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **6 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `snapshot` connect `Test Coverage & Flakiness` to `Testing Audit Findings`, `Testing Query-Priority Metrics`?**
  _High betweenness centrality (0.010) - this node is a cross-community bridge._
- **Why does `devDependencies` connect `Dev Dependencies & Tooling` to `Package Manifest & Scripts`?**
  _High betweenness centrality (0.006) - this node is a cross-community bridge._
- **Why does `snapshot` connect `Security Headers & CSP` to `Security Audit Findings`?**
  _High betweenness centrality (0.006) - this node is a cross-community bridge._
- **What connects `skillVersion`, `runStartedAt`, `runFinishedAt` to the rest of the system?**
  _497 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `Agentic Principles & Context` be split into smaller, more focused modules?**
  _Cohesion score 0.07764705882352942 - nodes in this community are weakly interconnected._
- **Should `Agentic Audit Findings` be split into smaller, more focused modules?**
  _Cohesion score 0.05405405405405406 - nodes in this community are weakly interconnected._
- **Should `Architecture Audit Detail` be split into smaller, more focused modules?**
  _Cohesion score 0.05555555555555555 - nodes in this community are weakly interconnected._