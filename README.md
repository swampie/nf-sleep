# nf-sleep — PLAT-4844 profile-resolution fixtures

Branch `plat-4844-profiles-test`. Three cases for the launch-form **Config profiles** dropdown.

| Main script | Config Nextflow loads at runtime | Profiles the dropdown should offer |
|---|---|---|
| `main.nf` (repo root) | root `nextflow.config` | `rootOnlyAlpha`, `rootOnlyBeta` |
| `workflows/no-config/main.nf` | none — no config beside the script | **none** (the bug: root profiles were offered and failed at launch) |
| `workflows/with-config/main.nf` | `workflows/with-config/nextflow.config` | `subdirGamma`, `subdirDelta` |

Nextflow sets `baseDir` to the script's parent directory and only loads `baseDir/nextflow.config`,
so root profiles are unreachable for a subdirectory main script.
