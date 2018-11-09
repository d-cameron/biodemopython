#!/bin/bash

set -e
errors=0

# Run unit tests
python biodemopython/biodemopython_test.py || {
    echo "'python python/biodemopython/biodemopython_test.py' failed"
    let errors+=1
}

# Check program style
pylint -E biodemopython/*.py || {
    echo 'pylint -E biodemopython/*.py failed'
    let errors+=1
}

[ "$errors" -gt 0 ] && {
    echo "There were $errors errors found"
    exit 1
}

echo "Ok : Python specific tests"
