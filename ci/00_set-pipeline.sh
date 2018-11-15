fly -t main set-pipeline \
  --pipeline build_packages_vroremote \
  --config pipeline.yml \
  --var "private-repo-key=$(cat myrsa.key)"

fly -t main unpause-pipeline -p build_packages_vroremote

