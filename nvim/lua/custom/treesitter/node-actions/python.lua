local helpers = require 'ts-node-action.helpers'

return {
  ['string_content'] = {
    require 'custom.treesitter.node-actions.pythonacts.f-string',
  },
  ['interpolation'] = {
    require 'custom.treesitter.node-actions.pythonacts.f-string',
  },
  ['list'] = {
    require 'custom.treesitter.node-actions.pythonacts.list.toggle-multilineness',
  },
  ['dictionary'] = {
    require 'custom.treesitter.node-actions.pythonacts.dict.literaldict-to-dictconstructor',
    require 'custom.treesitter.node-actions.pythonacts.dict.toggle-multilineness',
  },
  ['identifier'] = {
    require 'custom.treesitter.node-actions.pythonacts.dict.dictconstructor-to-literaldict',
  },
  ['class_definition'] = {
    require 'custom.treesitter.node-actions.pythonacts.doc.class',
  },
  ['function_definition'] = {
    require 'custom.treesitter.node-actions.pythonacts.doc.method',
  },
}
