local helpers = require 'ts-node-action.helpers'

return {
  ['string_content'] = {
    require 'custom.treesitter.node-actions.pythonacts.format-to-fstring',
    require 'custom.treesitter.node-actions.pythonacts.fstring-to-format',
  },
}
