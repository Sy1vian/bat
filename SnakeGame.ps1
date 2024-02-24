# PowerShell Snake Game

# Game settings
$width = 20
$height = 10
$gameOver = $false
$score = 0
$snake = @{'X'=10; 'Y'=5}
$food = @{'X'=7; 'Y'=3}
$direction = 'Right'

# Initialize game board
function DrawBoard {
    cls
    for ($y = 0; $y -lt $height; $y++) {
        for ($x = 0; $x -lt $width; $x++) {
            if ($x -eq $snake['X'] -and $y -eq $snake['Y']) {
                Write-Host '*' -NoNewline
            } elseif ($x -eq $food['X'] -and $y -eq $food['Y']) {
                Write-Host '%' -NoNewline
            } else {
                Write-Host ' ' -NoNewline
            }
        }
        Write-Host
    }
    Write-Host "Score: $score"
}

# Game loop
while (-not $gameOver) {
    DrawBoard

    # Input logic
    if ($host.UI.RawUI.KeyAvailable) {
        $key = $host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
        switch ($key.VirtualKeyCode) {
            37 { $direction = 'Left' }
            38 { $direction = 'Up' }
            39 { $direction = 'Right' }
            40 { $direction = 'Down' }
        }
    }

    # Move snake
    switch ($direction) {
        'Left'  { $snake['X']-- }
        'Up'    { $snake['Y']-- }
        'Right' { $snake['X']++ }
        'Down'  { $snake['Y']++ }
    }

    # Check for game over condition
    if ($snake['X'] -lt 0 -or $snake['X'] -ge $width -or $snake['Y'] -lt 0 -or $snake['Y'] -ge $height) {
        $gameOver = $true
        "Game Over! Your score was: $score"
        break
    }

    # Check for food collision
    if ($snake['X'] -eq $food['X'] -and $snake['Y'] -eq $food['Y']) {
        $score += 10
        $food['X'] = Get-Random -Minimum 0 -Maximum $width
        $food['Y'] = Get-Random -Minimum 0 -Maximum $height
    }

    Start-Sleep -Milliseconds 200
}

# End of game
Read-Host "Press Enter to exit..."
