local u = require 'custom.cmp.snippets.utils'

return {
  u.s('if-else', {
    u.t 'if ',
    u.i(1, 'condition'),
    u.t { ':', '\t' },
    u.i(2, 'expression'),
    u.t { '', 'else:', '\t' },
    u.i(3, 'expression'),
  }),
  u.s('if-elif', {
    u.t 'if ',
    u.i(1, 'condition'),
    u.t { ':', '\t' },
    u.i(2, 'expression'),
    u.t { '', 'elif ' },
    u.i(3, 'condition'),
    u.t { ':', '\t' },
    u.i(4, 'expression'),
  }),

  u.s('if-elif-else', {
    u.t 'if ',
    u.i(1, 'condition'),
    u.t { ':', '\t' },
    u.i(2, 'expression'),
    u.t { '', 'elif ' },
    u.i(3, 'condition'),
    u.t { ':', '\t' },
    u.i(4, 'expression'),
    u.t { '', 'else:', '\t' },
    u.i(5, 'expression'),
  }),

  u.s('ternary', {
    u.i(1, 'expression'),
    u.t { ' if  ' },
    u.i(2, 'condition'),
    u.t { ' else ' },
    u.i(3, 'expression'),
  }),
}
