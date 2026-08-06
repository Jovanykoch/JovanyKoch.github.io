#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

assert_contains() {
  local file="$1"
  local pattern="$2"
  if ! grep -Fq "$pattern" "$file"; then
    echo "Assertion failed: '$pattern' not found in $file" >&2
    exit 1
  fi
}

assert_not_contains_conflict_markers() {
  local target_dir="$1"
  if grep -R -n -E '^(<<<<<<<|=======|>>>>>>>)' "$target_dir" --exclude-dir=.git --exclude-dir=dist >/dev/null; then
    echo "Assertion failed: merge conflict markers found in repository" >&2
    exit 1
  fi
}

assert_not_contains_conflict_markers "$ROOT_DIR"

assert_contains "$ROOT_DIR/index.html" "<title>Jovany Koch</title>"
assert_contains "$ROOT_DIR/index.html" "https://github.com/Jovanykoch"
assert_contains "$ROOT_DIR/index.html" "https://gravatar.com/impossiblyfantasticda0603b02c"

assert_contains "$ROOT_DIR/README.md" "# Jovany Koch"
assert_contains "$ROOT_DIR/README.md" "JOLIET JUNIOR COLLEGE"

assert_contains "$ROOT_DIR/Surge/surge.conf" "[General]"
assert_contains "$ROOT_DIR/Surge/surge.conf" "[Proxy]"
assert_contains "$ROOT_DIR/Surge/surge.conf" "[Rule]"

for rule_file in ai.list apple.list canvas.list cn.list globadirect.list us.list; do
  if [[ ! -f "$ROOT_DIR/Surge/rule/$rule_file" ]]; then
    echo "Assertion failed: missing rule file $rule_file" >&2
    exit 1
  fi
done

echo "All tests passed"
