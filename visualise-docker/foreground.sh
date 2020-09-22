#!/bin/bash

wait_file() {
  local file="$1"; shift
  local wait_seconds="${1:-300}"; shift # 600 seconds as default timeout

  until test $((wait_seconds--)) -eq 0 -o -e "$file" ; do sleep 1; done

  ((++wait_seconds))
}

# Wait at most 5 seconds for the server.log file to appear

bgfile=/tmp/background.done

echo "waiting for background script to complete..."
wait_file "$bgfile" 300 || {
  echo "background script completion file missing after waiting for $? seconds: '$bgfile'"
  exit 1
}

which termdown
which httpie
git clone https://github.com/dockersamples/example-voting-app.git
cd example-voting-app/
docker-compose up -d
for i in $(seq 1 100); do VAL=$(shuf -n 1 -e a b); echo "VOTING: $VAL"; http --ignore-stdin -h -f POST "localhost:5000" vote=$VAL; done
#termdown -b 55m -f standard -t "< 5   MINS   LEFT!"
