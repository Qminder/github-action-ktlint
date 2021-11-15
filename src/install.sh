#!/usr/bin/env bash
set -eu

KTLINT_VERSION=0.43.0
KTLINT_CHECKSUM=211c98959fb689640c5ff81cf282867b

REVIEWDOG_VERSION=0.13.0
REVIEWDOG_CHECKSUM=2993478234218448d66fa34c275f8821fbdf99d8d63b7fa6ff3e6352f9e85df2


yum update -y
yum install -y tar gzip git
TMPDIR=${TMPDIR:-/tmp}

# ktlint
KTLINT_SOURCE=https://github.com/pinterest/ktlint/releases/download/${KTLINT_VERSION}/ktlint

curl -fsSL $KTLINT_SOURCE > ktlint
DOWNLOADED_CHECKSUM=$(md5sum ktlint | cut -d' ' -f1)

if [[ $DOWNLOADED_CHECKSUM != "$KTLINT_CHECKSUM" ]]; then
   echo "MD5 does not match, not executing further"
   exit 1
fi

chmod +x ktlint
mv ktlint /usr/local/bin/

# Reviewdog

REVIEWDOG_INSTALL_FILE=$TMPDIR/reviewdog.tar.gz
REVIEWDOG_SOURCE=https://github.com/reviewdog/reviewdog/releases/download/v${REVIEWDOG_VERSION}/reviewdog_${REVIEWDOG_VERSION}_Linux_x86_64.tar.gz

curl -fsSL $REVIEWDOG_SOURCE > "$REVIEWDOG_INSTALL_FILE"
DOWNLOADED_CHECKSUM=$(sha256sum "$REVIEWDOG_INSTALL_FILE" | cut -d' ' -f1)

if [[ $DOWNLOADED_CHECKSUM != "$REVIEWDOG_CHECKSUM" ]]; then
   echo "SHA256sum does not match, not executing further"
   exit 1
fi

tar --no-same-owner -xzf "$REVIEWDOG_INSTALL_FILE" reviewdog
chmod +x reviewdog
mv reviewdog /usr/local/bin/
