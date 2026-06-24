# setup_github.ps1
# Creates all GitHub Labels and Milestones for MockProject_062026_Team_BA
# Reads credentials from ../.env — never hardcodes secrets.

param(
    [switch]$DryRun
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

# ── Load .env ────────────────────────────────────────────────────────────────
$envFile = Join-Path $PSScriptRoot "../.env"
if (-not (Test-Path $envFile)) {
    Write-Error ".env not found. Copy .env.example to .env and fill in your token."
    exit 1
}
Get-Content $envFile | ForEach-Object {
    if ($_ -match "^\s*([^#][^=]+)=(.+)$") {
        [System.Environment]::SetEnvironmentVariable($Matches[1].Trim(), $Matches[2].Trim(), "Process")
    }
}

$TOKEN = $env:GITHUB_TOKEN
$OWNER = $env:GITHUB_OWNER
$REPO  = $env:GITHUB_REPO

if (-not $TOKEN -or -not $OWNER -or -not $REPO) {
    Write-Error "GITHUB_TOKEN, GITHUB_OWNER, and GITHUB_REPO must all be set in .env"
    exit 1
}

$headers = @{
    Authorization = "token $TOKEN"
    Accept        = "application/vnd.github+json"
}
$base = "https://api.github.com/repos/$OWNER/$REPO"

function Invoke-GH($method, $path, $body) {
    $uri = "$base$path"
    if ($DryRun) { Write-Host "[DRY-RUN] $method $uri"; return }
    try {
        if ($body) {
            Invoke-RestMethod -Uri $uri -Method $method -Headers $headers -Body ($body | ConvertTo-Json) -ContentType "application/json"
        } else {
            Invoke-RestMethod -Uri $uri -Method $method -Headers $headers
        }
    } catch {
        $raw = $_.ErrorDetails.Message
        $alreadyExists = $false
        if ($raw) {
            try {
                $msg = $raw | ConvertFrom-Json
                $alreadyExists = ($msg.PSObject.Properties["errors"] -and $msg.errors.Count -gt 0 -and $msg.errors[0].code -eq "already_exists")
            } catch {}
        }
        if ($alreadyExists) {
            Write-Host "  [skip] already exists"
        } else {
            Write-Warning "  [warn] $($_.Exception.Message) | $raw"
        }
    }
}

# ── Labels ───────────────────────────────────────────────────────────────────
$labels = @(
    # Priority
    @{ name = "P1-Critical";           color = "B60205"; description = "Blocks milestone delivery" }
    @{ name = "P2-High";               color = "E4E669"; description = "Must complete this sprint" }
    @{ name = "P3-Medium";             color = "0075CA"; description = "Important, not blocking" }
    @{ name = "P4-Low";                color = "CFD3D7"; description = "Nice to have" }
    # Document Type
    @{ name = "type:BRD";              color = "D4C5F9"; description = "Business Requirements Document" }
    @{ name = "type:SRS";              color = "C2E0C6"; description = "Software Requirements Specification" }
    @{ name = "type:User-Story";       color = "FEF2C0"; description = "User Story + Acceptance Criteria" }
    @{ name = "type:Wireframe";        color = "F9D0C4"; description = "UI wireframe or flow" }
    @{ name = "type:Test-Case";        color = "BFD4F2"; description = "Test case document" }
    @{ name = "type:Process-Diagram";  color = "E6E6E6"; description = "BPMN or process flow diagram" }
    @{ name = "type:Data-Dictionary";  color = "FBCA04"; description = "Data model or dictionary entry" }
    @{ name = "type:Use-Case";         color = "B4A8D1"; description = "Use case diagram or description" }
    # Status
    @{ name = "status:Draft";          color = "EDEDED"; description = "Work in progress" }
    @{ name = "status:In-Review";      color = "FFD700"; description = "Awaiting peer or lead review" }
    @{ name = "status:Needs-Revision"; color = "E99695"; description = "Review comments require changes" }
    @{ name = "status:Approved";       color = "0E8A16"; description = "Signed off by BA Lead" }
    # Sprint
    @{ name = "sprint:1";  color = "1D76DB"; description = "Sprint 1" }
    @{ name = "sprint:2";  color = "1D76DB"; description = "Sprint 2" }
    @{ name = "sprint:3";  color = "1D76DB"; description = "Sprint 3" }
    @{ name = "sprint:4";  color = "1D76DB"; description = "Sprint 4" }
    @{ name = "sprint:5";  color = "1D76DB"; description = "Sprint 5" }
    @{ name = "sprint:6";  color = "1D76DB"; description = "Sprint 6" }
    @{ name = "sprint:7";  color = "1D76DB"; description = "Sprint 7" }
    @{ name = "sprint:8";  color = "1D76DB"; description = "Sprint 8" }
    @{ name = "sprint:9";  color = "1D76DB"; description = "Sprint 9" }
    @{ name = "sprint:10"; color = "1D76DB"; description = "Sprint 10" }
    # Area
    @{ name = "area:Functional";     color = "5319E7"; description = "Functional requirement" }
    @{ name = "area:Non-Functional"; color = "006B75"; description = "NFR: performance, security, etc." }
    @{ name = "area:UI-UX";          color = "F1A340"; description = "Interface or UX concern" }
    @{ name = "area:Data";           color = "84B6EB"; description = "Data modeling or flow" }
    @{ name = "area:Compliance";     color = "CC317C"; description = "Regulatory or legal requirement" }
)

Write-Host "`nCreating labels ($($labels.Count) total)..."
foreach ($label in $labels) {
    Write-Host "  + $($label.name)"
    Invoke-GH "POST" "/labels" $label
}

# ── Milestones ───────────────────────────────────────────────────────────────
$milestones = @(
    @{ title = "M1 - Project Foundation";      description = "Sprint 1-2: Project Charter, Stakeholder Register, Business Glossary, As-Is Process Diagrams"; due_on = "2026-08-02T23:59:59Z" }
    @{ title = "M2 - Requirements Gathering";  description = "Sprint 3-4: Requirements Elicitation, BRD v1.0 Final";                                         due_on = "2026-09-13T23:59:59Z" }
    @{ title = "M3 - Requirements Analysis";   description = "Sprint 5-6: Use Cases, User Stories, SRS v1.0, Acceptance Criteria";                           due_on = "2026-10-25T23:59:59Z" }
    @{ title = "M4 - Design Specification";    description = "Sprint 7-8: Wireframes, Navigation Flows, Data Dictionary, NFR Specification";                  due_on = "2026-12-06T23:59:59Z" }
    @{ title = "M5 - Review and Sign-off";     description = "Sprint 9-10: Test Cases, RTM v1.0, Final Document Package, Retrospective";                      due_on = "2027-01-17T23:59:59Z" }
)

Write-Host "`nCreating milestones ($($milestones.Count) total)..."
foreach ($ms in $milestones) {
    Write-Host "  + $($ms.title)"
    Invoke-GH "POST" "/milestones" $ms
}

Write-Host "`nDone. Visit https://github.com/$OWNER/$REPO/labels to verify."
