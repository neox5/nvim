#!/usr/bin/env bash
# analyze_startup.sh — Neovim startup time (max/avg/min)

set -euo pipefail

N=${1:-10}
TMPLOG=$(mktemp)

stats=$(
  for _ in $(seq 1 "$N"); do
    nvim --headless --startuptime "$TMPLOG" +qa 2>/dev/null
    # The summary line is typically the first of the last two lines.
    tail -2 "$TMPLOG" | head -1 | awk '{print $1}'
  done |
    awk '
    NR == 1 { min = max = $1 }
    { sum += $1; if ($1 < min) min = $1; if ($1 > max) max = $1 }
    END { printf "Max: %.2f ms\nAvg: %.2f ms\nMin: %.2f ms", max, sum/NR, min }
  '
)

printf "Neovim startup benchmark (%d runs)\n" "$N"
printf "%s\n" "----------------------------------------"
printf "%s\n" "$stats"

rm -f "$TMPLOG"
