#!/usr/bin/env bash

set -euo pipefail

temp_skills=$(mktemp)
cat >>"$temp_skills" <<'EOF'
| Skill | Description |
| :---- | :---------- |
EOF

for dir in skills/*; do
	skill="${dir}/SKILL.md"
	[ -f "$skill" ] || continue

	name=$(awk '/^---$/{n++; next} n==1 && /^name:/{print $2; exit}' "$skill")
	desc=$(awk '
    /^---$/ { n++; next }
    n >= 2  { exit }
    n == 1 && /^description:/ {
      sub(/^description: *>? */, "")
      gsub(/"/, "")
      if (length($0) > 0 && $0 != ">") { printf "%s", $0; getline }
      else { getline }
      # Read continuation lines (indented)
      while (/^  +/) {
        sub(/^ +/, "")
        printf " %s", $0
        if (!getline) break
      }
      print ""
      exit
    }
  ' "$skill")

	[ -z "$name" ] && continue
	echo "| [${name}](${dir}) | ${desc} |" >>"$temp_skills"
done

echo "" >>"$temp_skills"

awk '
  /<!-- SKILLS_START -->/ { print; system("cat '"$temp_skills"'"); skip=1; next }
  /<!-- SKILLS_END -->/ { skip=0 }
  !skip
' README.md >README.md.tmp && mv README.md.tmp README.md

rm "$temp_skills"
