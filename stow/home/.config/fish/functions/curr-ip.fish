function curr-ip --description "Prints the current public IP and its location"
    curl --silent "ipinfo.io/?token=$IPINFO_TOKEN" \
        | jq -r '.ip + " (" + .city + ", " + .country + ")"'
end
