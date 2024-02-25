function logseq-release --description "Prints the latest logseq Github release"
	gh api /repos/logseq/logseq/releases/latest \
		| jq '{name, tag: .tag_name, published: .published_at, asset: .assets[]| select(.name|test("linux.*AppImage"))| {name,url:.browser_download_url} }'
end
