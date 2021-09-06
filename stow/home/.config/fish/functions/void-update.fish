function void-update --description "Update Void packages"
  log_info "Updating Void packages..."
  doas xbps-install --update
  set --local install_status $status
  switch $install_status
    case 0
      log_info "Void update done."
    case 16
      log_error "xbps needs to be updated."
    case '*'
	  log_error "Unhandled error code: $install_status."
  end
  return $install_status
end
