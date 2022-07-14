local date = function() return { os.date('%Y-%m-%d') } end
local now = function() return { os.date() } end

return {
  s({
    trig = 'date',
      namr = 'Date',
      dscr = 'Current date as YYYY-MM-DD',
    }, {
      f(date, {}),
  }),
  s({
    trig = 'now',
    namr = 'Now',
    dscr = 'Current timestamp',
    }, {
      f(now, {}),
  }),
}
