#!/bin/bash
TODOS=$(cat ~/Documents/personal/notes/todo.md | head -c -1 - | sed -z 's/\n/\\n/g')
printf '{"tooltip": "%s"}\n' "$TODOS"
