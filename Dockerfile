#BOF

FROM bbassett/openscad

RUN apt-get update && apt-get install --assume-yes git-restore-mtime bsdmainutils

#EOF