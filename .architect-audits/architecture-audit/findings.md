# Architecture audit report

A tiny, single-feature Vite-React + TypeScript template that scores **clean on every assessable invariant** — and this time the graph *proves* it rather than the prior run merely asserting it. The feature-folder pattern, the textbook pure-logic / hook / view split, and the single (React-local) state strategy all hold. **This run USED the Graphify knowledge graph** (703 nodes · 741 edges · 41 communities, built at `4973926114fdd9e6cd31b12464a25e58fcf53ccc`), so the five graph-derived checks the first static-only pass had to report as `missing` — no circular dependencies, no god module, no god component, component fan-out, no orphans — are now **computed and `present`** against real graph evidence. The repo also fixed the one outstanding soft gap: the public-surface barrel is now documented. The honest ceiling is still **scale**: with one feature there is no cross-feature coupling to measure and no `src/shared/` layer yet, so two checks remain `missing` for lack of a structural prerequisite, not for lack of the graph.

## Snapshot

- Repository: `AgenticProjectTemplate` (agentic-project-template)
- Commit: `02d36ecca8746812e4265a3f6534a2c2cdbeefb2`
- Generated: 2026-06-17T12:00:00Z
- Mode: **graph-enriched** — `graphify-out/graph.json` present and consulted (NOT noGraphify).
- Graphify revision: `4973926114fdd9e6cd31b12464a25e58fcf53ccc` (703 nodes, 741 edges, 41 communities, 89 files ingested).
- Meta-framework: Vite-React (`vite` ^6 + `react`/`react-dom` ^19, `@vitejs/plugin-react`).
- Language: TypeScript ^5.7, strict `tsconfig.json` (`strict`, `noUncheckedIndexedAccess`, `noUnusedLocals/Parameters`, `verbatimModuleSyntax`).
- Architectural pattern: `feature-folders` — `src/features/<feature>/` slice (view/hook/three-tests/barrel); `main.tsx` + `App.tsx` compose above. Graphify isolates the slice as **community 23 "Threshold-Counter Feature"** (cohesion 0.22), the only source-code community in the graph.
- Monorepo: No. `pnpm-workspace.yaml` carries only `allowBuilds`/advisory overrides; no `packages/`. Cross-workspace checks N/A.
- Source code: 8 files / 15 graph nodes in `src/`; 1 feature folder. Deepest path depth 3; no `../../` or deeper relative imports. Largest TS/TSX source 52 lines (all under the 400 budget). State: React local only.
- **Graph-derived facts (computed this run):** import cycles **0**; max source-file fan-in **4** (`ThresholdCounter.tsx`); max source-file fan-out **2** (`App.tsx`); largest source hub **`ThresholdCounter()` at 5 edges** (the top four whole-graph hubs are doc/decision *concepts*, not code); orphan source modules **0**.

> Full snapshot in `snapshot.md`.
> **Scale caveat:** the clean graph is real evidence, but it is evidence about **one** feature. Feature-to-feature isolation, a `src/shared/` layer, and cross-feature coupling are still unexercised because the structure to exercise them does not exist yet.

---

## What changed vs the prior static-only run

| Check | Prior run | This run | Why it changed |
| --- | --- | --- | --- |
| no-circular-dependencies | `missing` (noGraphify) | **present** | Graph + DFS confirm a strict DAG; GRAPH_REPORT: "Import Cycles: None detected". |
| no-god-module | `missing` (noGraphify) | **present** | Largest source hub is 5 edges (`ThresholdCounter()`), ~6x under the 30 threshold. |
| no-god-component | `missing` (noGraphify) | **present** | `ThresholdCounter` has 1 rendering parent (`App.tsx`); 4 total inbound incl. tests + barrel. |
| component-fan-out-budget | `missing` (noGraphify) | **present** | Max source fan-out 2 (`App.tsx`), far below the 15 threshold. |
| no-orphaned-files | `missing` (noGraphify) | **present** | Every `src/` file reachable from `main.tsx`; the only inbound-0 nodes are legitimate roots (entry, tests, barrel). |
| public-api-documented | `partial` | **present** | The repo fix: `index.ts` now carries a 3-line doc comment naming the public surface and marking the hook/rules private. |

Two checks remain `missing` for the **same** reason as before, unrelated to the graph: `no-back-imports-across-boundaries` (only one feature, no sibling edges to test) and `data-fetching-layer-separated` (no data fetching exists — deliberately deferred). `cross-workspace-contracts` and `server-client-distinction` remain N/A (not a monorepo, not App Router).

---

## Status tally

| Layer | present | partial | missing | violation |
| --- | --- | --- | --- | --- |
| Module boundaries | 3 | 0 | 2 | 0 |
| Coupling & complexity | 5 | 0 | 0 | 0 |
| State & data flow | 3 | 0 | 2 | 0 |
| Convention adherence | 4 | 0 | 0 | 0 |
| **Total** | **15** | **0** | **4** | **0** |

Every remaining `missing` is a structural-prerequisite or not-applicable skip; **none indicates a defect**, and **none is now blocked by the absence of the graph**.

---

## Layer 1 — Module boundaries

### no-circular-dependencies — present (graph-derived; was missing)
- **Expectation:** the dependency graph is acyclic.
- **Status: present.** Computed two ways: (1) GRAPH_REPORT.md "Import Cycles: None detected"; (2) an independent DFS this audit ran over the file-level import subgraph confirms a strict DAG: `main.tsx -> App.tsx -> index.ts -> ThresholdCounter.tsx -> useThresholdCounter.ts`, with test files as leaf importers. Zero back-edges across the 8 source files.
- **Evidence:** `graphify-out/GRAPH_REPORT.md`; `graphify-out/graph.json` (community 23 edges).

### feature-single-entry-point — present
- **Expectation:** each feature exposes a barrel and external imports go through it.
- **Status: present.** `src/features/threshold-counter/index.ts:4` re-exports `ThresholdCounter`. The one external importer, `src/App.tsx:1`, imports `from './features/threshold-counter'` (the folder root -> barrel), not a deep path. The graph's `App.tsx -> ThresholdCounter.tsx` edge is a *resolved/transitive* edge through the barrel's re-export, not a deep-path bypass.
- **Evidence:** `src/features/threshold-counter/index.ts:4`; `src/App.tsx:1`.
- **Gap:** proven for one feature with one consumer; discipline at scale unobserved.

### no-deep-relative-imports — present
- **Status: present.** Grep for `../../../` and `../../` across `src/` returns zero matches. All intra-feature imports are single-level siblings.

### no-back-imports-across-boundaries — missing (structural prerequisite absent)
- **Status: missing.** Only one feature exists, so the graph contains no sibling-feature edges to evaluate. The rule is documented (ARCHITECTURE.md rule 1, "Features are islands"); it is simply untested. Re-evaluate when a second feature lands — the graph will then surface any sibling->internals edge directly.

### cross-workspace-contracts — missing / N/A
- **Status: N/A.** Not a monorepo. Skipped per SKILL.md.

---

## Layer 2 — Coupling and complexity (thresholds: godModule 30, godComponent 25, fileSize 400, fanOut 15)

### no-god-module — present (graph-derived; was missing)
- **Status: present.** The top whole-graph hubs by connectivity are documentation/decision *concepts* — `Quality Gate` (8 edges), `Feature-Folder Architecture` (7), `Definition of Done` (6), `Behaviour Map` (6) — not code. The single most-connected **source** node is `ThresholdCounter()` at **5 edges**, roughly 6x under the 30 threshold. Max source-file fan-in is 4 (`ThresholdCounter.tsx`). No source module approaches god-node status.
- **Evidence:** `graphify-out/GRAPH_REPORT.md` (God Nodes); `graph.json` fan-in computation.

### no-god-component — present (graph-derived; was missing)
- **Status: present.** `ThresholdCounter()` inbound = 4: `App.tsx` (the one real rendering parent), `index.ts` (barrel re-export), and the two component test files. Exactly **one** rendering parent — far below the 25 threshold.
- **Evidence:** `graph.json` (edges targeting `threshold_counter_thresholdcounter_thresholdcounter`).

### file-size-budget — present
- **Status: present.** Largest TS/TSX source `ThresholdCounter.test.tsx` 52; `useThresholdCounter.ts` 47; `ThresholdCounter.tsx` 46; `useThresholdCounter.test.ts` 44; `App.tsx`/`main.tsx` 15; `a11y.test` 12; `index.ts` 4. All <= 52, well under 400.

### component-fan-out-budget — present (graph-derived; was missing)
- **Status: present.** Max source-file fan-out is `App.tsx` = 2; `ThresholdCounter.tsx` = 1 (`-> useThresholdCounter.ts`). Both far below the 15 threshold. No component is doing too much.
- **Evidence:** `graph.json` file-level import edges.

### no-orphaned-files — present (graph-derived; was missing)
- **Status: present.** Every `src/` file is reachable from `main.tsx`. The only nodes with zero inbound import edges are the legitimate roots: `main.tsx` (the entry), the three test files, and the `index.ts` barrel (itself imported by `App.tsx`). No dead source modules. The 492 "isolated nodes" GRAPH_REPORT flags are audit-report fields and config-key leaves, not source code.
- **Evidence:** `graph.json` reachability; `GRAPH_REPORT.md` Knowledge Gaps section (correctly attributed to non-source nodes).

---

## Layer 3 — State and data flow

### single-state-management-strategy — present
- **Status: present.** `package.json` declares no state library. State is React-local: `useState`/`useMemo`/`useCallback` in `useThresholdCounter.ts`. Single coherent strategy.

### data-fetching-layer-separated — missing (structural prerequisite absent)
- **Status: missing.** No data fetching exists — grep for `fetch(`/`axios`/`XMLHttpRequest` in `src/` is empty. ARCHITECTURE.md deliberately defers a data layer. Nothing to evaluate.

### no-global-mutable-singletons — present
- **Status: present.** No `export let` in `src/`. Module-level exports are `const` (`WARNING_THRESHOLD`, `CRITICAL_THRESHOLD`) and pure functions/types.

### side-effects-isolated — present
- **Status: present.** No `localStorage`/`sessionStorage`/`document.cookie`/`window.*` in `src/`. The one DOM access (`document.getElementById('root')`) lives in `main.tsx`, the composition root, and fails loudly if `#root` is missing.
- **Evidence:** `src/main.tsx:6-9`.

### server-client-distinction — missing / N/A
- **Status: N/A.** Vite-React, not Next.js App Router. Skipped per SKILL.md.

---

## Layer 4 — Convention adherence

### file-naming-consistency — present
- **Status: present.** folder `threshold-counter` (kebab); `ThresholdCounter.tsx` (Pascal); `useThresholdCounter.ts` (useCamelCase, same-name); tests `<Name>.test.tsx` / `.a11y.test.tsx` co-located; constants SCREAMING_SNAKE_CASE; types PascalCase. No outliers vs CONVENTIONS.md.

### directory-structure-consistency — present
- **Status: present.** The single feature folder matches the canonical view + hook + tests + barrel shape in ARCHITECTURE.md.

### index-barrels-consistent — present
- **Status: present.** The one feature folder has a barrel; no second feature to diverge. Convention codified in ARCHITECTURE.md rule 3 and CONVENTIONS.md.

### public-api-documented — present (was partial — repo fixed)
- **Status: present.** `src/features/threshold-counter/index.ts:1-3` now carries a 3-line doc comment naming the public surface and stating the hook and pure rules are private, with a pointer to ARCHITECTURE.md. The prior run's one soft `partial` is resolved, and it sets the doc-comment template every future barrel copies.
- **Evidence:** `src/features/threshold-counter/index.ts:1-3`.

---

## Bottom line

**Zero violations, zero partials, zero `missing` caused by the graph being absent.** The graph turned the prior run's five `noGraphify` blanks into five concrete `present` verdicts — acyclic, no god module/component, bounded fan-out, no orphans — and the repo's own fix closed the last soft gap (documented barrel). What remains `missing` is purely structural-not-yet-built (one feature, no data layer) or not-applicable (no monorepo, no App Router). The architecture is correct **as far as it can be evaluated**, and the graph widened how far that is. The one question still beyond this audit's reach: whether the discipline holds when the second, fifth, and twentieth feature land — which only a larger codebase (and a re-`graphify` of it) can answer.

Full machine-readable results: `.architect-audits/architecture-audit/findings.json`. Snapshot: `.architect-audits/architecture-audit/snapshot.md`. Run metadata: `.architect-audits/architecture-audit/metadata.json`.
