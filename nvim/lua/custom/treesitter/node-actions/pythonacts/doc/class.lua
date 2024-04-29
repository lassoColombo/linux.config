local helpers = require 'ts-node-action.helpers'

return {
  function(node)
    local query = vim.treesitter.query.parse(
      'python',
      [[
          (
            (class_definition
              name: (identifier) @classname
              superclasses: (argument_list) @superclasses
              body: (block) @body)
          )
        ]]
    )
    local clname, superclasses, body = nil, nil, nil
    for _, matches, _ in query:iter_matches(node, 0) do
      if #matches ~= 3 then
        print '😥 something went wrong'
        return
      end
      clname = matches[1]
      superclasses = matches[2]
      body = matches[3]
    end

    local docstring = { '\t"""', string.format('\t%s ...', helpers.node_text(clname)) }

    if superclasses then
      table.insert(docstring, '\tIt inherits from:')
      for i = 0, superclasses:named_child_count() - 1 do
        local class = helpers.node_text(superclasses:named_child(i))
        table.insert(docstring, string.format('\t\t- %s: ...', class))
      end
    end
    table.insert(docstring, '\t"""')
    table.insert(docstring, '')

    -- :NOTE: this is here to mock the target node.
    -- if i were to give a real target node, it would be overridden
    local fake_node = {}
    fake_node.range = function()
      local start_row, start_col, _, _ = body:range()
      return start_row - 1, start_col - 4, start_row - 1, start_col - 4
    end

    return docstring, { target = fake_node }
  end,

  name = 'generate doc for class',
}
