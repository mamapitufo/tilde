function sync-drive --description "Syncs gDrive"
  set --local changed find . -cnewer last-sync -type d
  drive push ($changed); and touch last-sync
end
