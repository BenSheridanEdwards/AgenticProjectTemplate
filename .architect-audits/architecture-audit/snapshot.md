# Snapshot

- Repository: `AgenticProjectTemplate` (agentic-project-template)
- Commit: `02d36ecca8746812e4265a3f6534a2c2cdbeefb2`
- Generated: 2026-06-17T12:00:00Z
- Mode: **graph-enriched** — `graphify-out/graph.json` present (built at `4973926114fdd9e6cd31b12464a25e58fcf53ccc`, 703 nodes · 741 edges · 41 communities · 89 files ingested). All graph-derived checks were computed, not skipped.

## Detected stack

- **Meta-framework:** Vite-React (`vite` ^6 + `react`/`react-dom` ^19, `@vitejs/plugin-react`). Not Next.js, not Remix.
- **Language:** TypeScript ^5.7 with a strict `tsconfig.json` (`strict`, `noUncheckedIndexedAccess`, `noUnusedLocals/Parameters`, `verbatimModuleSyntax`, `isolatedModules`). Confirmed TypeScript project.
- **Architectural pattern:** `feature-folders`. Rationale: one `src/features/<feature>/` slice with co-located view (`ThresholdCounter.tsx`), hook (`useThresholdCounter.ts`), three tests (`ThresholdCounter.test.tsx`, `ThresholdCounter.a11y.test.tsx`, `useThresholdCounter.test.ts`), and a documented barrel (`index.ts`); composition root (`main.tsx`) and layout (`App.tsx`) sit above. Graphify isolates this slice as **community 23 "Threshold-Counter Feature"** — the only source-code community in a graph otherwise dominated by docs/config. Matches `.agents/project/ARCHITECTURE.md`.
- **Monorepo:** No application workspaces. A `pnpm-workspace.yaml` exists but carries only `allowBuilds`/advisory-override declarations — no `packages/` directory, no workspace globs. Treated as single-package; cross-workspace checks N/A.

## Graph diagnostic (Layer 0 — computed from graphify-out/graph.json)

- **Total graph:** 703 nodes, 741 edges, 41 communities. The graph spans the whole repo (source + docs + audit reports + config), not just `src/`. Source code is **15 nodes** across 8 files, all in **community 23**.
- **God nodes (top by connectivity, whole graph):**
  1. `Quality Gate` — 8 edges (concept, `.agents/decisions/0002`)
  2. `Feature-Folder Architecture` — 7 edges (concept, `ARCHITECTURE.md`)
  3. `Definition of Done` — 6 edges (concept)
  4. `Behaviour Map` — 6 edges (concept, `.agents/decisions/0003`)
  5. **`ThresholdCounter()` — 5 edges (the largest SOURCE-CODE hub)**
  The top four hubs are documentation/decision concepts, not code. The single most-connected *code* node is `ThresholdCounter()` at 5 edges — an order of magnitude under the god-module threshold (30).
- **Import cycles:** **none** — confirmed both by GRAPH_REPORT ("Import Cycles: None detected") and by an independent DFS over the file-level import subgraph this audit ran.
- **Fan-in / fan-out (whole graph):** mean fan-in 1.05 (median 1, max 8); mean fan-out 1.05 (median 0, max 30 — that max is the `package.json` `scripts` object enumerating its keys, a documentation artefact, not a code coupling).
- **Source import graph (file level, the architecture-relevant view):**
  - `main.tsx` → `App.tsx`
  - `App.tsx` → `index.ts` (barrel) [resolved transitively to `ThresholdCounter.tsx`]
  - `index.ts` → `ThresholdCounter.tsx` (re-export)
  - `ThresholdCounter.tsx` → `useThresholdCounter.ts`
  - `*.test.*` → the unit under test
  - Highest source file fan-in: `ThresholdCounter.tsx` = 4 (App + barrel + 2 tests). Highest source file fan-out: `App.tsx` = 2. Both far below every threshold.
- **Communities:** 41 total; the only source community is #23 (cohesion **0.22** — the highest-cohesion non-trivial community in the graph, reflecting the tight, well-bounded feature slice). The remaining 40 communities are documentation, audit-report, and config clusters with low cohesion (0.05–0.50), which is expected for prose/JSON and not an architecture signal.
- **Weakly-connected / isolated nodes:** GRAPH_REPORT reports 492 isolated nodes and ~497 weakly-connected — but these are almost entirely audit-report fields and config keys (`skillVersion`, `runStartedAt`, `compilerOptions` leaves, etc.), **not** source modules. Every `src/` file is reachable from `main.tsx`; there are no orphaned source modules.
- **Directory depth:** deepest application path = `src/features/threshold-counter/*` (depth 3 under repo root). Average source path depth 2.33. No `../../` or deeper relative imports anywhere in `src/`.
- **File sizes:** largest TS/TSX source is `ThresholdCounter.test.tsx` at 52 lines; `useThresholdCounter.ts` 47, `ThresholdCounter.tsx` 46, `useThresholdCounter.test.ts` 44, `App.tsx`/`main.tsx` 15, `a11y.test` 12, `index.ts` 4. All far under the 400-line budget. (`index.css` 152 lines, not TS.)
- **State management:** React local state only (`useState`/`useMemo`/`useCallback` in `useThresholdCounter.ts`). No Redux/Zustand/Jotai/MobX/Recoil/TanStack Query/SWR in dependencies.

## Honest scale caveat

This is a deliberately **tiny single-feature template**, not a production app. The graph now *proves* the structural invariants that the prior static run could only assert (acyclicity, no god node, no orphans, bounded fan-out) — but it proves them over **one** feature. There is still no second feature to exercise feature-to-feature isolation, no `src/shared/` layer yet (intentionally omitted per ARCHITECTURE.md), and no cross-feature coupling to measure. The clean graph is real evidence; it is just evidence about a small surface. Grade the design intent and the one fully-measured instance — the open question (does the discipline hold at the 5th and 20th feature?) remains unanswerable from one slice.
