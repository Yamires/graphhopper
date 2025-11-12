#!/bin/bash
set -e

MODULES="${1:-}"
EXCLUDED_MODULES=""
# ${EXCLUDED_MODULES:-core|reader-gtfs|web}
if [ -z "$MODULES" ]; then
  echo "No specific modules provided. Running full build."
  MODULES=$(ls -d */pom.xml 2>/dev/null | cut -d'/' -f1 | \
    grep -Ev "^($EXCLUDED_MODULES)$" | tr '\n' ',' | sed 's/,$//')
  echo "Running PIT on all testable modules: $MODULES"
else
  echo "Running PIT on selected modules: $MODULES"
fi

if [ -z "$MODULES" ]; then
  echo "No modules to test. Exiting."
  exit 0
fi

echo "Starting PIT mutation testing..."

mvn -B org.pitest:pitest-maven:mutationCoverage \
  -pl "$MODULES" \
  -DtargetClasses='com.graphhopper.*' \
  -DtargetTests='com.graphhopper.*Test' \
  -DreportsDirectory=target/pit-reports \
  -DoutputFormats=XML,HTML \
  -DtimestampedReports=false \
  -Dthreads=2 \
  -DjvmArgs='-Xmx6G' \
  -DtimeoutConstant=60000 \
  -DtimeoutFactor=2 \
  -DdependencyDistance=0 \
  -DfailWhenNoMutations=false

echo "PIT mutation testing completed"
