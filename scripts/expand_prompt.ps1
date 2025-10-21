<#
Expand prompt helper

Usage:
  .\scripts\expand_prompt.ps1 [-Path <file>] [--expand]

If --expand is given, the script will replace known macro placeholders with the contents of
their macro files (currently supports UTALA_BASE_STYLE from prompts/macros/base_style.md).
The resulting prompt is copied to the Windows clipboard for easy pasting.
#>

param(
  [string]$Path = "docs/COPILOT_PROMPTS.md",
  [switch]$expand
)

function Get-MacroContent {
  param([string]$name)
  switch ($name) {
    'UTALA_BASE_STYLE' { Get-Content -Raw -ErrorAction SilentlyContinue "prompts/macros/base_style.md" }
    default { return $null }
  }
}

if (-not (Test-Path $Path)) {
  Write-Error "File not found: $Path"
  exit 1
}

$content = Get-Content -Raw $Path

if ($expand) {
  # Replace macro placeholders like [UTALA_BASE_STYLE]
  $content = $content -replace '\[UTALA_BASE_STYLE\]', (Get-MacroContent 'UTALA_BASE_STYLE')
}

# Copy to clipboard
Set-Clipboard -Value $content
Write-Output "Prompt copied to clipboard ($(if ($expand) { 'expanded' } else { 'compact' }))"
