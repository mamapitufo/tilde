local status_ok, which_key = pcall(require, 'which-key')
if status_ok then
  which_key.register({
    ['[,'] = 'Previous argument boundary',
    ['],'] = 'Next argument boundary',
    ['<,'] = 'Shift current argument left',
    ['>,'] = 'Shift current argument right',
  })
end

