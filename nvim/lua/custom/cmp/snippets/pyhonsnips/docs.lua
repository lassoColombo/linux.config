local u = require 'custom.cmp.snippets.utils'
return {
  u.s('docstring', {
    u.t { '"""', '' },
    u.i(1, 'doc'),
    u.t { '', '"""', '' },
  }),
}
