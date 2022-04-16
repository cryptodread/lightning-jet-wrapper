#!/bin/bash

DURATION=$(</dev/stdin)
if (($DURATION <= 5000)); then
    exit 60
else
    if ! curl --silent --fail lightning-jet.embassy &>/dev/null; then
        echo "Lightning Jet is unreachable" >&2
        exit 1
    fi
fi