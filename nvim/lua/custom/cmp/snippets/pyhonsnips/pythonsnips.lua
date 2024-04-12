local u = require 'custom.cmp.snippets.utils'

u.ls.add_snippets(
  'python',
  u.concat(
    require 'custom.cmp.snippets.pyhonsnips.pprint',
    require 'custom.cmp.snippets.pyhonsnips.docs',
    require 'custom.cmp.snippets.pyhonsnips.conditionals'
  )
)
