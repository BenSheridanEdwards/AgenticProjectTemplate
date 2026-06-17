# Testing audit report

Repository: `AgenticProjectTemplate` · Runner: Jest 29 (jsdom, @swc/jest) · E2E: Playwright · Mode: static, **graph-enriched** · Generated 2026-06-17T12:00:00Z

This is a re-run of the audit after the testing setup was deliberately improved, and the first run **with the Graphify knowledge graph available** (the prior run was `noGraphify: true`). The suite that was already well-crafted is now also **complete in shape**: the two graded weaknesses from the prior run are both resolved. `getByTestId` has been removed entirely — the component test now asserts the count through visible text (`getByText`) and the live `status` region, pushing the Priority 1 ratio to **100%** and the `getByTestId` ratio to **0%**. A new `useThresholdCounter.test.ts` adds a pure-rule table test for `statusForCount` (all branches) and a `renderHook` test for the reset-to-non-zero path. A new `ThresholdCounter.a11y.test.tsx` asserts `jest-axe`'s `toHaveNoViolations`, with `jest.setup.ts` extending `expect`, and `e2e/accessibility.spec.ts` runs a real-browser `@axe-core/playwright` scan. `pnpm verify` now runs `test:coverage` (the coverage gate is enforced, also in CI), coverage is reported at 100%, and `jest.config.ts` documents its exclusions inline. The graph confirms the `Threshold-Counter Feature` community (component + pure rule + hook) is now fully covered.

The only graded residual is a single **`partial`**: the accessibility/selector-lint guarantees of `eslint-plugin-testing-library` and `eslint-plugin-jest-dom` are not enforced by any linter, because the project lints with Biome rather than ESLint. This is shared with `/linting-audit` and Biome is a legitimate choice, so it stays `partial`, not `violation`. The remaining honest notes are forward-looking, not defects in today's code: there are no error-path/async tests because the feature is synchronous and cannot throw, so the template sets no pattern for that case yet.

---

## Snapshot

# Snapshot

- Repository: `AgenticProjectTemplate` (agentic-project-template@0.1.0)
- Generated: 2026-06-17T12:00:00Z
- Mode: static (no `--with-run`)
- Graphify output present: **yes** (graph-enriched — `graphify-out/graph.json`, 703 nodes / 741 edges; the `Threshold-Counter Feature` community maps the four units the tests cover)

## Tooling detected

- Test runner: **Jest** `^29.7.0` (jsdom, `@swc/jest`)
- Component library: **@testing-library/react** `^16.1.0` (+ user-event `^14.5.2`, jest-dom `^6.6.3`)
- Accessibility assertion: **jest-axe** `^10.0.0` (unit) + **@axe-core/playwright** `^4.11.3` (real browser)
- End-to-end: **Playwright** (`@playwright/test` `^1.49.1`)
- Lint: **Biome** (no ESLint → testing-library/jest-dom ESLint plugins not applicable)
- jest-dom loaded in `jest.setup.ts:3`; jest-axe matcher registered `jest.setup.ts:6-8`; coverage thresholds 80% global with documented exclusions (`jest.config.ts:30-39`); gate enforced by `pnpm verify` -> `test:coverage` (`package.json:28`) and CI (`.github/workflows/ci.yml:58`)

## Query usage distribution (unit suite, 12 total `*By*` queries — all in `ThresholdCounter.test.tsx`)

| Tier | Query | Count | % all |
| --- | --- | --- | --- |
| Priority 1 | `getByRole` (named / `status`) | 8 | 66.7% |
| Priority 1 | `getByText` | 4 | 33.3% |
| Priority 3 | `getByTestId` | 0 | 0% |

- Priority 1 ratio **100%** (thr 70%) · `getByRole` share of P1 **66.7%** (thr 50%) · `getByTestId` ratio **0%** (ceiling 10%) · querySelector **0**
- `userEvent` **6** / `fireEvent` **0** -> **100%** (thr 80%)
- Snapshots **0** · `toHaveClass` **0** · `waitFor`/`cleanup` **0** · fixed waits **0**
- `act` **5** — all `renderHook` state mutations (required pattern), none wrapping `render`
- Coverage reported **100%** across the collected surface (`App.tsx`/`main.tsx`/`index.ts` excluded by documented `collectCoverageFrom`)

---

## Summary

| Layer | present | partial | missing | violation |
| --- | --- | --- | --- | --- |
| Test runner and tooling | 7 | 1 | 0 | 0 |
| Query priority and selector hygiene | 7 | 0 | 0 | 0 |
| Interaction and async patterns | 8 | 0 | 0 | 0 |
| Test design and coverage | 8 | 1 | 0 | 0 |

Status vocabulary: **present** (invariant holds) · **partial** (mostly holds / soft check, mixed) · **missing** (structural prerequisite absent) · **violation** (concrete code breaks the invariant).

**Change vs prior run:** `get-by-testid-is-rare` violation -> **present**; `query-distribution-favours-priority-one` partial -> **present**; `coverage-thresholds-in-ci` partial -> **present**; `coverage-enforced-in-ci` partial -> **present**; `components-have-minimal-coverage` partial -> **present**. Net: 2 fewer violations (now 0), 4 fewer partials (now 1, the Biome/ESLint-plugin gap).

---

## Layer 1 — Test runner and tooling

### single-test-runner — present
- Expectation: Exactly one of Vitest or Jest in `devDependencies`.
- Evidence: `package.json:59` declares `jest ^29.7.0` only; no `vitest`. Config at `jest.config.ts`.
- Gap: None.

### testing-library-react-installed — present
- Expectation: React Testing Library present in a React project that ships tests.
- Evidence: `package.json:49` `@testing-library/react ^16.1.0` (React 19, `package.json:33`).
- Gap: None.

### user-event-installed — present
- Expectation: `@testing-library/user-event` available for interaction simulation.
- Evidence: `package.json:50` `@testing-library/user-event ^14.5.2`; used in `ThresholdCounter.test.tsx:2`.
- Gap: None.

### jest-dom-installed — present
- Expectation: `@testing-library/jest-dom` available for DOM-aware matchers.
- Evidence: `package.json:48` `@testing-library/jest-dom ^6.6.3`.
- Gap: None.

### jest-dom-loaded-in-setup — present
- Expectation: The runner setup file imports jest-dom.
- Evidence: `jest.setup.ts:3` `import '@testing-library/jest-dom';`, wired via `setupFilesAfterEnv` (`jest.config.ts:12`). Matchers `toHaveTextContent`/`toBeInTheDocument` used across `ThresholdCounter.test.tsx`. The same setup file also registers the jest-axe matcher (`jest.setup.ts:6-8`).
- Gap: None.

### coverage-thresholds-configured — present
- Expectation: Coverage configuration with explicit line/statement/branch/function thresholds.
- Evidence: `jest.config.ts:37-39` sets `coverageThreshold.global` to `{ branches: 80, functions: 80, lines: 80, statements: 80 }`; the `collectCoverageFrom` exclusions are now documented inline with rationale (`jest.config.ts:30-36`).
- Gap: None. (See Layer 4 `coverage-thresholds-in-ci` and `coverage-enforced-in-ci` — both now `present`.)

### eslint-testing-library-and-jest-dom-plugins — partial
- Expectation: `eslint-plugin-testing-library` and `eslint-plugin-jest-dom` installed and enabled (shared with `/linting-audit`).
- Evidence: The project lints with **Biome** (`biome.json`, `package.json:39`), not ESLint. Neither plugin is present, and there is no ESLint config for them to attach to. Confirmed via the graph: the `Biome Lint & Format Config` and `Dev Dependencies & Tooling` communities contain no ESLint or eslint-plugin nodes.
- Gap: The class of selector/async/matcher mistakes these plugins catch automatically (`no-node-access`, `prefer-screen-queries`, `no-wait-for-multiple-assertions`, `prefer-find-by`, `valid-expect-in-promise`) is unguarded by any linter. The three current tests are all clean, so the risk is latent: it bites the *next* test author, not these.
- Remediation: Either adopt Biome-equivalent rules where they exist, or run a thin ESLint pass scoped to `**/*.test.{ts,tsx}` enabling the two plugins. Reported `partial` because the linting concern is primarily `/linting-audit`'s and Biome is a legitimate choice. **Unchanged from prior run** — this gap was not part of the improvement scope.

### end-to-end-framework-present — present
- Expectation: Playwright or Cypress present.
- Evidence: `package.json:43` `@playwright/test ^1.49.1`; config `playwright.config.ts`; specs `e2e/app.spec.ts` and `e2e/accessibility.spec.ts`.
- Gap: None. See Layer 4 `critical-path-e2e`.

---

## Layer 2 — Query priority and selector hygiene

### query-distribution-favours-priority-one — present  *(was partial)*
- Expectation: >=70% of all `*By*` queries are Priority 1.
- Evidence: 12 of 12 queries (100%) are Priority 1 — 8 `getByRole` (`ThresholdCounter.test.tsx:15,21,26,31,37,38,39,50`) and 4 `getByText` (`:14,42,46,49`). No Priority 2, no Priority 3.
- Gap: None. **Resolved:** the four `getByTestId('count')` calls that dragged the prior run to 66.7% were replaced with `getByText('0'/'2')` and the `status`-region assertion. The count's visible text and the live `status` region are now the assertion surface.

### get-by-testid-is-rare — present  *(was violation)*
- Expectation: <=10% of all queries use `getByTestId`.
- Evidence: **0** `getByTestId` calls in the entire suite (and `data-testid` removed from `ThresholdCounter.tsx`; grep across `src/` and `e2e/` returns nothing). 0% < 10% ceiling.
- Gap: None. **Resolved:** the non-accessible `data-testid="count"` hook is gone; the count is asserted through the accessibility tree (visible text + `role="status"` live region), exactly as the rest of the suite already did.

### no-container-queryselector — present
- Expectation: No `container.querySelector` / `document.querySelector` for element lookup.
- Evidence: Zero occurrences. The one `container` reference is `axe(container)` in the a11y test (`ThresholdCounter.a11y.test.tsx:9-11`) — the documented jest-axe API, passing the root for an accessibility scan, not a query-by-selector.
- Gap: None.

### queries-via-screen — present
- Expectation: Queries come from `screen.*`, not a destructured `render` return.
- Evidence: All 12 queries are `screen.getBy*` (`ThresholdCounter.test.tsx`); `render(...)` return is never captured there. The a11y test destructures `{ container }` solely to feed `axe(...)` — not for queries.
- Gap: None.

### render-return-named-view — present
- Expectation (soft): When captured, the render return is named `view`, not `wrapper`.
- Evidence: Component test never captures the render return. The a11y test destructures `{ container }` (a documented field, not a `wrapper` alias).
- Gap: None.

### by-role-is-dominant-priority-one — present
- Expectation (soft): >=50% of Priority 1 queries are `getByRole` with `name`.
- Evidence: 8/12 (66.7%) of Priority 1 queries are `getByRole`, each named (`{ name: /increase/i }` etc.) or the implicit `status` role. The remaining 4 are `getByText` against visible numeric content — the correct Priority 1 query for non-interactive text.
- Gap: None. (Ratio dropped from 100% to 66.7% only because the testid replacements landed as `getByText`, which is still Priority 1 — above the 50% byRole floor.)

### no-redundant-aria-roles — present
- Expectation: Tests do not assert implicit roles redundantly.
- Evidence: `getByRole('status')` targets the implicit live-region role of `<output>` (`ThresholdCounter.tsx:25`) — a legitimate semantic query. No `role="button"` assertions on `<button>`. The a11y test asserts *absence* of violations rather than any redundant role.
- Gap: None.

---

## Layer 3 — Interaction and async patterns

### user-event-preferred-over-fire-event — present
- Expectation: >=80% of interactions use `userEvent`.
- Evidence: 6 `user.click(...)` calls, 0 `fireEvent` -> 100% (`ThresholdCounter.test.tsx:24,30,41,44,45,48`); driven by `userEvent.setup()` (`:19,36`).
- Gap: None.

### find-for-elements-not-yet-present — present
- Expectation: `findBy*` for elements that appear later, not `waitFor(() => getBy*())`.
- Evidence: The component updates synchronously on click; the suite asserts directly with `getBy*` and no `waitFor` is used or needed.
- Gap: None.

### query-only-for-absence — present
- Expectation: `queryBy*` only with absence assertions.
- Evidence: No `queryBy*` usage anywhere.
- Gap: None.

### waitfor-single-assertion / waitfor-not-empty / no-side-effects-in-waitfor — present
- Expectation: `waitFor` discipline.
- Evidence: No `waitFor` in the suite (0 occurrences), so none of the misuse patterns can occur.
- Gap: None.

### no-unnecessary-act — present
- Expectation: No hand-rolled `act(...)` around `render` / interactions.
- Evidence: The 5 `act(...)` calls are **all** in `useThresholdCounter.test.ts:33-41`, each wrapping a hook state mutation under `renderHook` (`result.current.decrement()`, `increment()`, `reset()`). This is the **required** RTL pattern for driving a hook outside a component — it is not the discouraged `act(() => render(...))` or `act(() => fireEvent(...))` wrapping (grep for `act(() => render` / `act(async` returns nothing). The component test correctly uses none.
- Gap: None. (The audit's check targets needless `act` around `render`/`fireEvent`; hook-update `act` is correct and out of scope.)

### no-manual-cleanup — present
- Expectation: No imported/called `cleanup`.
- Evidence: Zero `cleanup` references; Jest auto-cleanup relied upon.
- Gap: None.

### assertions-are-explicit — present
- Expectation: Tests assert via `expect(...)`, not bare `getBy*` throwing.
- Evidence: Every component query feeds `expect(...).toBeInTheDocument()` / `.toHaveTextContent(...)`; the hook test asserts `expect(result.current.count).toBe(...)` / `statusForCount(...)` `.toEqual(...)`; the a11y test asserts `expect(await axe(container)).toHaveNoViolations()`. No bare-query lines.
- Gap: None.

---

## Layer 4 — Test design and coverage

### tests-describe-user-behaviour — present
- Expectation (soft): Test names describe user-visible behaviour.
- Evidence: `'starts healthy at zero'`, `'warns as it approaches the limit, then reports capacity at the threshold'`, `'never decrements below zero and can be reset'` (`ThresholdCounter.test.tsx:11,18,34`) are user-observable. The hook test `'increments, floors decrement at zero, and resets to the initial value'` (`useThresholdCounter.test.ts:28`) describes observable hook contract behaviour rather than implementation calls. The `statusForCount` table test `'maps count %i to the %s level'` names a pure-rule mapping — appropriate for a pure function. The a11y test `'has no axe-detectable accessibility violations'` is outcome-named. The Playwright tests are journey/outcome-named.
- Gap: None. (Promoted to `present`: all names are behaviour- or contract-oriented, none assert internal state shape or call sequences.)

### no-utility-class-assertions — present
- Expectation: No `toHaveClass` against raw utility classes.
- Evidence: Zero `toHaveClass` assertions in the unit suite; the E2E specs assert only on `status` text and roles.
- Gap: None.

### snapshots-bounded-and-intentional — present
- Expectation: Snapshots small, intentional, named; none oversized or implementation-coupled.
- Evidence: Zero snapshot tests anywhere.
- Gap: None.

### coverage-thresholds-in-ci — present  *(was partial)*
- Expectation: The 80% gate guards the real surface.
- Evidence: Thresholds set (`jest.config.ts:37-39`). The `collectCoverageFrom` exclusions (`jest.config.ts:27-36`) are now **documented inline**: `index.ts` re-export barrels carry no logic; `main.tsx`/`App.tsx` are the composition root, exercised by the E2E behaviour map (`e2e/app.spec.ts`) rather than the unit suite — "Feature logic is NOT excluded." Coverage over the collected feature surface (`statusForCount`, `useThresholdCounter`, `ThresholdCounter`) is reported at **100%**. The graph's `Threshold-Counter Feature` community confirms the three logic-bearing units of the feature are all on the collected surface and all tested.
- Gap: None on the present surface. **Resolved:** the prior run flagged that the gate guarded a *narrowed and undocumented* surface and that the pure rule / hook were untested; both are addressed — `statusForCount` and `useThresholdCounter` now have direct tests, and the exclusion rationale is explicit. The exclusion of `App.tsx` is a deliberate composition-root choice, now covered by the E2E journey and documented. (Forward note: re-validate the exclude list whenever a new top-level surface is added.)

### coverage-enforced-in-ci — present  *(was partial)*
- Expectation (soft): CI fails when coverage regresses.
- Evidence: `coverageThreshold` makes `jest --coverage` exit non-zero on regression. `pnpm verify` (`package.json:28`) now runs `pnpm test:coverage` (not plain `jest`), so a coverage drop fails the local composite gate. CI confirms it: `.github/workflows/ci.yml:58` runs `pnpm test:coverage` in the `test` job (graph communities `Verify-Gates Script` / `CI Workflow Jobs Pipeline`).
- Gap: None. **Resolved:** the prior run's exact finding — that `verify` ran plain `jest` without `--coverage` and no CI workflow was observable — is fixed on both fronts (verify now coverage-gated, and a CI `test:coverage` job exists).

### critical-path-e2e — present
- Expectation (soft): At least one Playwright/Cypress spec covers the primary user journey.
- Evidence: `e2e/app.spec.ts:9-28` walks the full healthy->warning->at-capacity->reset journey using `getByRole`. `e2e/accessibility.spec.ts` adds a real-browser WCAG scan on the landing page. (`styleproof.spec.ts` is a computed-style capture, inert without `STYLEMAP_DIR`.)
- Gap: None for the one feature that exists. As features are added, each needs its own journey.

### no-flaky-pattern-signals — present
- Expectation: No fixed waits, ordering dependence, or shared mutable state.
- Evidence: Zero `setTimeout`/`setInterval`; each `it` does its own `render`/`renderHook` and `userEvent.setup()`; the `statusForCount` cases are an `it.each` table (independent rows); no module-level mutable state; Playwright runs `fullyParallel` (`playwright.config.ts`).
- Gap: None.

### mocking-at-module-boundaries — present
- Expectation (soft): Mocks at module/network boundaries, not internal helpers.
- Evidence: No mocks at all; the component and hook are tested as real units, and `statusForCount` is tested as a pure function. No internal-helper mocking to penalise.
- Gap: None. (No async/error paths exist to mock — see the forward note below.)

### components-have-minimal-coverage — present  *(was partial)*
- Expectation (soft): Every user-facing component has at least one referencing test (graph-aware when Graphify present).
- Evidence (**graph-enriched**): The graph's `Threshold-Counter Feature` community (`ThresholdCounter()`, `statusForCount()`, `useThresholdCounter`, `ThresholdLevel`, `ThresholdStatus`) is now fully covered:
  - `ThresholdCounter` — component test (`ThresholdCounter.test.tsx`) + a11y test (`ThresholdCounter.a11y.test.tsx`).
  - `statusForCount` (`useThresholdCounter.ts:19-27`) — direct table test covering all three branches at the boundaries `0 / WARNING-1 / WARNING / CRITICAL-1 / CRITICAL / CRITICAL+1` (`useThresholdCounter.test.ts:12-25`). The pure rule the docstring says exists "so the business rule can be unit-tested in isolation" is now tested in isolation.
  - `useThresholdCounter` (`useThresholdCounter.ts:37-47`) — `renderHook` test (`useThresholdCounter.test.ts:27-43`) exercising increment, decrement floored at zero, and **reset to a non-zero initial** (`useThresholdCounter(2)` -> reset returns to `2`, not `0`) — the previously-unexercised `reset` path.
  - Accessibility is now asserted, not merely implied: `jest-axe` `toHaveNoViolations` at the unit level (`ThresholdCounter.a11y.test.tsx`) and `@axe-core/playwright` in a real browser (`e2e/accessibility.spec.ts`).
  - `App()` / `rootElement` remain composition-root nodes covered by the E2E journey and excluded from `collectCoverageFrom` by documented design.
- Gap: None among the feature's logic units. **Resolved:** every prior sub-finding (pure rule untested, no hook-isolation test, no a11y-assertion library) is fixed.
- **Forward note (not a defect today):** there are still **no error-path or async-failure tests**, because the feature is synchronous and cannot throw — honest about *this* code, but the template establishes no pattern for the team to follow when async/error paths arrive. When the first async surface lands, the suite should add a `findBy*` appearance test and an error-state assertion so the pattern is set.

---

## Honest bottom line

The improvements landed cleanly and the re-grade reflects real change, not optimism. Both graded violations from the prior run are gone: `getByTestId` is removed (Priority 1 now 100%, testid 0%), and the coverage gate is genuinely enforced (`verify` -> `test:coverage`, plus a CI `test:coverage` job). The previously-flagged surface gaps are closed by two new, well-formed tests — a pure-rule table test that covers every `statusForCount` branch and a `renderHook` test that finally exercises reset-to-non-zero — and accessibility is now *asserted* at two layers (jest-axe in jsdom, axe-core in a real browser) rather than merely implied by role queries. The graph corroborates this: the `Threshold-Counter Feature` community is fully covered.

One graded `partial` remains, and it is honest to keep it: the auto-fixing guarantees of `eslint-plugin-testing-library` / `eslint-plugin-jest-dom` are unenforced because the linter is Biome, not ESLint. That is a `/linting-audit`-shared concern and Biome is a legitimate choice, so it is not a violation. The only other caveat is forward-looking: the suite is exemplary for a synchronous feature but sets no error-path/async pattern, because none exists to test yet. For a template whose job is to set the pattern, that is the next thing to add the day an async surface appears — not a defect in what ships today.
