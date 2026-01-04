# Claude Code Status Line Script for Windows
# Reads JSON input from stdin and formats a helpful status line

param()

# Read JSON input from stdin
$jsonInput = $input | Out-String | ConvertFrom-Json

# Extract useful information
$cwd = $jsonInput.workspace.current_dir
$projectDir = $jsonInput.workspace.project_dir
$modelName = $jsonInput.model.display_name
$outputStyle = $jsonInput.output_style.name
$contextWindow = $jsonInput.context_window
$version = $jsonInput.version

# Build status line parts
$parts = @()

# 1. Working Directory (absolute path)
$parts += $cwd

# 2. Git Branch and Status (if in a git repo)
if (Test-Path (Join-Path $cwd ".git")) {
    try {
        Push-Location $cwd
        $branch = git rev-parse --abbrev-ref HEAD 2>$null
        if ($branch) {
            # Check for uncommitted changes
            $status = git status --porcelain 2>$null
            $gitInfo = "git:$branch"
            if ($status) {
                $gitInfo += "*"
            }
            $parts += $gitInfo
        }
        Pop-Location
    } catch {
        Pop-Location
    }
}

# 3. Model Name (shortened)
$shortModel = switch -Wildcard ($modelName) {
    "*Opus*" { "Opus" }
    "*Sonnet*" { "Sonnet" }
    "*Haiku*" { "Haiku" }
    default { $modelName }
}
$parts += $shortModel

# 4. Context Window Usage (if available)
if ($contextWindow.current_usage -ne $null) {
    $currentUsage = $contextWindow.current_usage
    $totalTokens = $currentUsage.input_tokens +
                   $currentUsage.cache_creation_input_tokens +
                   $currentUsage.cache_read_input_tokens
    $contextSize = $contextWindow.context_window_size

    if ($contextSize -gt 0) {
        $percentage = [math]::Floor(($totalTokens * 100) / $contextSize)
        $parts += "${percentage}% ctx"
    }
}

# 5. Output Style (if not default)
if ($outputStyle -and $outputStyle -ne "default") {
    $parts += "[$outputStyle]"
}

# Join all parts with a separator and output
$statusLine = $parts -join " | "
Write-Host $statusLine
