#!/bin/bash

background="0x100F0F"
border="0x282726"
occupied="0x24837B"
urgent="0xA02F6F"

river-tag-overlay \
  --border-width 2 \
  --square-size 44 \
  --square-inner-padding 8 \
  --square-padding 8 \
  --square-border-width 1 \
  --margins 2:2:2:2 \
  --background-colour "$background" \
  --border-colour "$border" \
  --square-active-border-colour "$border" \
  --square-urgent-border-colour "$background" \
  --square-active-background-colour "$urgent" \
  --square-inactive-border-colour "$border" \
  --square-inactive-background-colour "$background" \
  --square-urgent-background-colour "$border" \
  --square-active-occupied-colour "$urgent" \
  --square-inactive-occupied-colour "$occupied" \
  --square-urgent-occupied-colour "$urgent" &
