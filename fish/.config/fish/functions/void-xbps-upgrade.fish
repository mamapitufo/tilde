function void-xbps-upgrade --description "Upgrade the xbps package"
  log_info "Updating xbps..."
  doas xbps-install --update xbps
  if test $status -eq 0
    log_info "xbps upgrade done."
  else
    log_error "xbps upgrade failed!"
    return 1
  end
end
