return {
	s({
		trig = "doctype",
		namr = "doctype",
		dscr = "HTML Skeleton",
	}, {
		t({
			"<!DOCTYPE html>",
			"<html>",
			"  <head>",
			'    <meta charset="utf-8">',
			'    <meta name="viewport" content="width=device-width, initial-scale=1">',
			"    <title>",
		}),
		i(1),
		t({ "</title>", "  </head>", "  <body>", "    " }),
		i(0),
		t({ "", "  </body>", "</html>" }),
	}),
	s({
		trig = "css",
		namr = "css",
		dscr = "Sylesheet link",
	}, {
		t({ '<link rel="stylesheet" href="' }),
		i(1, "path/to.css"),
		t({ '" />' }),
		i(0),
	}),
	s({
		trig = "js",
		namr = "js",
		dscr = "JavaScript block",
	}, {
		t({ '<script type="text/javascript">' }),
		i(1),
		t({ "</script>" }),
		i(0),
	}),
}
