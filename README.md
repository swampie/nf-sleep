# nf-sleep — PLAT-4844 profile-resolution fixtures

Branch `plat-4844-profiles-test`. Three cases for the launch-form **Config profiles** dropdown.

| Main script | Config Nextflow loads at runtime | Profiles the dropdown should offer |
|---|---|---|
| `main.nf` (repo root) | root `nextflow.config` | `rootOnlyAlpha`, `rootOnlyBeta` |
| `workflows/no-config/main.nf` | none — no config beside the script | **none** (the bug: root profiles were offered and failed at launch) |
| `workflows/with-config/main.nf` | `workflows/with-config/nextflow.config` | `subdirGamma`, `subdirDelta` |

Nextflow sets `baseDir` to the script's parent directory and only loads `baseDir/nextflow.config`,
so root profiles are unreachable for a subdirectory main script.

## v2 syntax variant

`v2/main.nf` is written in the Nextflow v2 language (`script:` block with triple-quoted
string instead of the removed `/.../` delimiters). It lints clean under `NXF_SYNTAX_PARSER=v2`,
whereas the root `main.nf` fails with `Unexpected input: '}'`.

Use it for any test that needs a run to actually succeed with the v2 parser enabled.
`v2/nextflow.config` also defines profiles `v2Quick` (2s) and `v2Slow` (30s).
