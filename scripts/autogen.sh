#!/usr/bin/env bash

# Pre-requisites:
# - foundry (https://getfoundry.sh/)
# - rsync (https://github.com/WayneD/rsync)
# - bun (https://bun.sh)
# - sd (https://github.com/chmln/sd)

# Strict mode: https://gist.github.com/vncsna/64825d5609c146e80de8b1fd623011ca
set -euo pipefail

# ---------------------------------------------------------------------------- #
#                                    Common                                    #
# ---------------------------------------------------------------------------- #

# Define the reference directories
all=docs/reference/
airdrops=docs/reference/airdrops/contracts
flow=docs/reference/flow/contracts
lockup=docs/reference/lockup/contracts

# Delete the current reference documentations
find $airdrops -type f -name "*.md" -delete
find $flow -type f -name "*.md" -delete
find $lockup -type f -name "*.md" -delete

lint() {
  reference=docs/reference/$1/contracts

  # Format the docs with Prettier
  bun prettier --log-level silent --write $reference

  # Remove the italic asterisks added by `forge doc`: https://github.com/foundry-rs/foundry/issues/4540
  sd --string-mode "\*" "" $(find $reference -type f -name "*.md")

  # Re-format the docs with Prettier
  bun prettier --log-level silent --write $reference
}

run() {
  # This is either "airdrops", "flow" or "lockup"
  repo=$1

  # cd into the repo
  cd repos/$repo

  # Delete the previously generated docs
  rm -rf ./docs

  # Auto-generate the reference with Forge
  forge doc

  # Go back to the root
  cd ../../../

  # Define the reference directory
  reference=docs/reference/$repo/contracts

  # Delete the current reference
  find $reference -type f -name "*.md" -delete

  # Copy over the auto-generated files
  rsync --archive \
  --exclude "README.md" \
  --exclude "SUMMARY.md" \
  repos/$repo/docs/src/src/* \
  $reference

  # Move all Markdown files one level up
  find $reference -type f -name "*.md" -execdir mv {} .. \;

  # Delete empty *.sol directories
  find $reference -type d -empty -delete

  # Replace the interface references, e.g. {ISablierLockup}, with hyperlinks
  sd "\{I(\w+)\}" "[I\$repo](/$reference/interfaces/interface.I\$repo.md)" $(find $reference -type f -name "*.md")

  # Replace the contract references, e.g. {SablierLockup}, with hyperlinks
  # Note: abstract contracts won't work
  sd "\{Sablier(\w+)\}" "[Sablier\$repo](/$reference/contract.Sablier\$repo.md)" $(find $reference -type f -name "*.md")

  # Update the hyperlinks to use the directory structure of the docs website
  # We need the capturing group to avoid replacing the "Git Source" URLs
  sd "src/abstracts/\w+\.sol/([\w.]+)" $reference'/abstracts/$1' $(find $reference -type f -name "*.md")
  sd "src/interfaces/\w+\.sol/([\w.]+)" $reference'/interfaces/$1' $(find $reference -type f -name "*.md")
  sd "src/\w+\.sol/([\w.]+)" $reference/'$1' $(find $reference -type f -name "*.md")
}

# ---------------------------------------------------------------------------- #
#                                     Lockup                                   #
# ---------------------------------------------------------------------------- #

# Generate the raw docs with Forge
run "lockup"

# Reorder the contracts in the sidebar
contract=$lockup/contract.SablierLockup.md
echo "$(echo -en '---\nsidebar_position: 1\n---\n'; cat $contract)" > $contract

contract=$lockup/contract.SablierBatchLockup.md
echo "$(echo -en '---\nsidebar_position: 1\n---\n'; cat $contract)" > $contract

contract=$lockup/contract.SablierV2NFTDescriptor.md
echo "$(echo -en '---\nsidebar_position: 3\n---\n'; cat $contract)" > $contract

lint "lockup"

# ---------------------------------------------------------------------------- #
#                                   Airdrops                                   #
# ---------------------------------------------------------------------------- #

# Generate the raw docs with Forge
run "airdrops"

# The Airdrops has certain references to the Lockup
sd "\{SablierLockup\}" "[SablierLockup]($lockup/abstracts/abstract.SablierLockup.md)" $(find $reference -type f -name "*.md")

# Reorder the contracts in the sidebar
contract=$airdrops/contract.SablierMerkleFactory.md
echo "$(echo -en '---\nsidebar_position: 2\n---\n'; cat $contract)" > $contract

contract=$airdrops/contract.SablierMerkleInstant.md
echo "$(echo -en '---\nsidebar_position: 3\n---\n'; cat $contract)" > $contract

contract=$airdrops/contract.SablierMerkleLL.md
echo "$(echo -en '---\nsidebar_position: 3\n---\n'; cat $contract)" > $contract

contract=$airdrops/contract.SablierMerkleLT.md
echo "$(echo -en '---\nsidebar_position: 3\n---\n'; cat $contract)" > $contract

lint "airdrops"

# ---------------------------------------------------------------------------- #
#                                      Flow                                    #
# ---------------------------------------------------------------------------- #

# Generate the raw docs with Forge
run "flow"

# Reorder the contracts in the sidebar
contract=$flow/contract.SablierFlow.md
echo "$(echo -en '---\nsidebar_position: 1\n---\n'; cat $contract)" > $contract

contract=$flow/contract.FlowNFTDescriptor.md
echo "$(echo -en '---\nsidebar_position: 2\n---\n'; cat $contract)" > $contract

lint "flow"
