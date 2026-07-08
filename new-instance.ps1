<#
.SYNOPSIS
    Scaffold a new client instance of the Fabric Playbook.

.PARAMETER ClientSlug
    Kebab-case identifier used as the folder name (e.g. "acme-logistics").

.PARAMETER ClientName
    Display name for the client (e.g. "Acme Logistics A/S").

.PARAMETER Archetype
    Base archetype: A1, A2, or A3. See archetypes.md.

.EXAMPLE
    .\new-instance.ps1 -ClientSlug "acme-logistics" -ClientName "Acme Logistics A/S" -Archetype A2
#>
param(
    [Parameter(Mandatory)][string]$ClientSlug,
    [Parameter(Mandatory)][string]$ClientName,
    [Parameter(Mandatory)][ValidateSet("A1","A2","A3")][string]$Archetype
)

$root            = $PSScriptRoot
$instanceRoot    = Join-Path $root "instances\$ClientSlug"
$pagesDir        = Join-Path $instanceRoot "pages"
$diagramsDir     = Join-Path $instanceRoot "diagrams"
$libraryPages    = Join-Path $root "library\topics\pages"
$libraryDiagrams = Join-Path $root "library\topics\diagrams"

if (Test-Path $instanceRoot) {
    Write-Error "Instance '$ClientSlug' already exists at '$instanceRoot'. Aborting."
    exit 1
}

New-Item -ItemType Directory -Path $pagesDir    | Out-Null
New-Item -ItemType Directory -Path $diagramsDir | Out-Null

# Copy library pages (including dotfiles such as .order)
Get-ChildItem -Path $libraryPages -Force | Copy-Item -Destination $pagesDir

# Copy library diagrams
if (Test-Path $libraryDiagrams) {
    Get-ChildItem -Path $libraryDiagrams | Copy-Item -Destination $diagramsDir
}

$today = Get-Date -Format 'yyyy-MM-dd'

# --- org-profile.yaml (from library template) ----------------------------------
$orgProfileTemplate = Join-Path $root "library\templates\org-profile.yaml"
((Get-Content $orgProfileTemplate -Raw) -replace '<Client Name>', $ClientName `
    -replace '<ARCHETYPE>', $Archetype -replace '<DATE>', $today) |
    Set-Content "$instanceRoot\org-profile.yaml" -Encoding UTF8

# --- assessment.md (from library template) -------------------------------------
$assessmentTemplate = Join-Path $root "library\templates\assessment.md"
(Get-Content $assessmentTemplate -Raw) -replace '<Client Name>', $ClientName |
    Set-Content "$instanceRoot\assessment.md" -Encoding UTF8

# --- README.md (instance manifest) --------------------------------------------
@"
# Playbook — $ClientName

| | |
|---|---|
| **Archetype** | $Archetype |
| **Sovereignty** | standard |
| **Last reviewed** | $today |

## Page status

| # | Topic | Status |
|---|---|---|
| 00 | [How to use](pages/00-how-to-use.md) | implemented |
| 01 | [Strategy & Outcomes](pages/01-strategy.md) | proposed |
| 02 | [People & Operating Model](pages/02-people-operating-model.md) | proposed |
| 03 | [Governance Classes](pages/03-governance-classes.md) | proposed |
| 04 | [Governance, Catalog & Quality](pages/04-governance.md) | proposed |
| 05 | [Platform Architecture](pages/05-architecture.md) | proposed |
| 06 | [Ingestion & Data Flow](pages/06-ingestion.md) | proposed |
| 07 | [Transformation & Modelling](pages/07-transformation-modelling.md) | proposed |
| 08 | [Semantic Serving & Reporting](pages/08-semantic-serving.md) | proposed |
| 09 | [Engineering & CI/CD](pages/09-engineering-cicd.md) | proposed |
| 10 | [Security, Access & Residency](pages/10-security-access.md) | proposed |
| 11 | [Capacity, FinOps & Reliability](pages/11-capacity.md) | proposed |
| 12 | [Naming Standards](pages/12-naming-standards.md) | proposed |
| 13 | [Enablement & Adoption](pages/13-enablement-adoption.md) | proposed |
| 14 | [Roadmap & Migration](pages/14-roadmap.md) | proposed |

Archetype reference: [archetypes.md](../../archetypes.md) · Agent rules: [AGENTS.md](../../AGENTS.md)
"@ | Set-Content "$instanceRoot\README.md" -Encoding UTF8

Write-Host ""
Write-Host "Instance created: $instanceRoot"
Write-Host ""
Write-Host "Next steps:"
Write-Host "  1. Run the assessment (library\assessment-kit.md) -> fill assessment.md + org-profile.yaml"
Write-Host "  2. Run the waves per library\facilitation-kit.md (Wave 0 -> 4, gates in between)"
Write-Host "  3. Per domain: copy library\templates\domain-onboarding.md and run the onboarding session"
Write-Host "  4. Update README.md page status as topics are ratified"
