function zenbrowser-release --description "Prints the latest Zen Browser Github release"
	gh api /repos/zen-browser/desktop/releases/latest \
		| jq '{name, tag: .tag_name, published: .published_at, asset: .assets[]| select(.name == "zen-x86_64.AppImage")| {name,url:.browser_download_url} }'
end
