local helpers = require 'ts-node-action.helpers'

return {
  ['string_content'] = {
    require 'custom.treesitter.node-actions.pythonacts.f-string',
  },
  ['interpolation'] = {
    require 'custom.treesitter.node-actions.pythonacts.f-string',
  },
  ['list'] = {
    require 'custom.treesitter.node-actions.pythonacts.list',
  },
  ['dictionary'] = {
    require 'custom.treesitter.node-actions.pythonacts.literaldict-to-dictconstructor',
  },
  ['identifier'] = {
    require 'custom.treesitter.node-actions.pythonacts.dictconstructor-to-literaldict',
  },
}
