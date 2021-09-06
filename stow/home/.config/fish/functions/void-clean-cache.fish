function void-clean-cache --description "Remove obsolete binary packages from xbps cache"
  log_info "Cleaning xbps cache..."
  doas xbps-remove -v --clean-cache
  log_info "xbps cache cleaned."
end
