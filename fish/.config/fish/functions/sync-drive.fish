function sync-drive --description "Syncs gDrive"
  set -l changed find . -cnewer last-sync -type d
  drive push (changed); and touch last-sync
end
