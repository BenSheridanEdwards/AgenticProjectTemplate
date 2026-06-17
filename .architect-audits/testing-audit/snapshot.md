# Snapshot

- Repository: `AgenticProjectTemplate` (agentic-project-template@0.1.0)
- Generated: 2026-06-17T12:00:00Z
- Mode: static (no `--with-run`)
- Graphify output present: **yes** (graph-enriched — `graphify-out/graph.json`, 703 nodes / 741 edges; the `Threshold-Counter Feature` community maps the four units the tests cover)

## Tooling detected

- Test runner: **Jest** `^29.7.0` (jsdom environment, `@swc/jest` transform, no Babel)
- Component testing library: **@testing-library/react** `^16.1.0` (+ `@testing-library/dom`, `@testing-library/user-event` `^14.5.2`, `@testing-library/jest-dom` `^6.6.3`)
- Accessibility assertion: **jest-axe** `^10.0.0` (unit-level `toHaveNoViolations`) + **@axe-core/playwright** `^4.11.3` (real-browser scan)
- End-to-end framework: **Playwright** (`@playwright/test` `^1.49.1`)
- Lint stack: **Biome** `^1.9.4` (no ESLint → `eslint-plugin-testing-library` / `eslint-plugin-jest-dom` are not applicable; their guarantees remain unenforced by any linter)
- jest-dom matchers loaded via `jest.setup.ts:3` (`setupFilesAfterEnv`); jest-axe matcher registered via `jest.setup.ts:6-8` (`expect.extend(toHaveNoViolations)`)
- Coverage thresholds configured: global 80% across branches / functions / lines / statements (`jest.config.ts:37-39`); exclusions documented inline (`jest.config.ts:30-36`)
- Coverage gate enforced: `pnpm verify` runs `pnpm test:coverage` (`package.json:28`); CI `test` job runs `pnpm test:coverage` (`.github/workflows/ci.yml:58`)

## File inventory

- Unit/component test files: **3**
  - `src/features/threshold-counter/ThresholdCounter.test.tsx` (behaviour/component, 3 `it` blocks)
  - `src/features/threshold-counter/useThresholdCounter.test.ts` (pure-rule table test + `renderHook` hook-isolation test, 2 `it`/`it.each` blocks)
  - `src/features/threshold-counter/ThresholdCounter.a11y.test.tsx` (jest-axe a11y assertion, 1 `it` block)
- End-to-end spec files: **3**
  - `e2e/app.spec.ts` (behaviour map — one user journey)
  - `e2e/accessibility.spec.ts` (real-browser axe scan, WCAG 2.0/2.1 A+AA)
  - `e2e/styleproof.spec.ts` (computed-style capture surface; inert unless `STYLEMAP_DIR` set — not a behavioural assertion)
- Test count (static count of `it`/`it.each`/`test` blocks; exact figure requires `--with-run`): **6** unit assertions (3 component + 1 `it.each` over 6 cases + 1 hook + 1 a11y) across 3 files; **2** Playwright behavioural/a11y `test` blocks

## Query usage distribution

Total Testing-Library `*By*` queries in unit suite: **12** (all in `ThresholdCounter.test.tsx`; the hook test and a11y test use no `*By*` queries by design)

| Tier | Query | Count | % of all queries |
| --- | --- | --- | --- |
| Priority 1 | `getByRole` (with `name` / implicit `status`) | 8 | 66.7% |
| Priority 1 | `getByText` | 4 | 33.3% |
| Priority 1 | `getByLabelText` / `getByPlaceholderText` / `getByDisplayValue` | 0 | 0% |
| Priority 2 | `getByAltText` / `getByTitle` | 0 | 0% |
| Priority 3 | `getByTestId` | 0 | 0% |

- Priority 1 ratio: **100%** (threshold 70%) → **above** (was 66.7% in the prior run)
- `getByRole` share of Priority 1: **66.7%** (8/12) (threshold 50%) → above
- `getByTestId` ratio: **0%** (ceiling 10%) → **clean** (was 33.3% in the prior run)
- `container.querySelector` / `document.querySelector`: **0**

## Interaction & async

- `userEvent` calls: **6**; `fireEvent` calls: **0** → userEvent ratio **100%** (threshold 80%)
- `waitFor`: 0 · `findBy*`: 0 · `queryBy*`: 0 · `cleanup`: 0
- `act(...)`: **5**, all in `useThresholdCounter.test.ts` and all wrapping hook state mutations under `renderHook` (`result.current.decrement()` etc.) — the **required** RTL pattern for driving a hook, NOT the discouraged `act(() => render())` / `act(() => fireEvent(...))` wrapping. No `act` around `render` anywhere.
- All component interactions correctly `await`ed against `userEvent.setup()`

## Design & coverage

- Snapshot tests: **0** (no `toMatchSnapshot` / `toMatchInlineSnapshot`) — clean
- `toHaveClass` assertions: **0** (no utility-class coupling) — clean
- Flaky-pattern signals: fixed `setTimeout`/`setInterval` waits **0**; ordering-dependent tests **0**; shared mutable state **0**
- Accessibility assertion library: **present** — `ThresholdCounter.a11y.test.tsx` asserts `toHaveNoViolations(await axe(container))`; `e2e/accessibility.spec.ts` runs a real-browser axe scan
- Coverage: reported **100%** across the collected surface (`statusForCount`, `useThresholdCounter`, `ThresholdCounter`)
- `collectCoverageFrom` (`jest.config.ts:27-36`) excludes `src/**/index.ts` (re-export barrels), `src/main.tsx` and `src/App.tsx` (composition root, exercised by the E2E behaviour map) — the exclusions are now **documented inline** with rationale. Feature logic is explicitly NOT excluded.
- Graph-enriched components-without-tests check: the `Threshold-Counter Feature` graph community (`ThresholdCounter()`, `statusForCount()`, `useThresholdCounter`, `ThresholdLevel`, `ThresholdStatus`) is now fully covered — the component, the pure rule, and the hook each have a dedicated test. `App()` / `rootElement` remain composition-root nodes covered by the E2E journey, not the unit suite (excluded by config, by design).
