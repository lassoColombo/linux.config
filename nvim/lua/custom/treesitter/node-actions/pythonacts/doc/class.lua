local helpers = require 'ts-node-action.helpers'

local function get_init(class_body)
  for body_child in class_body:iter_children() do
    if body_child:type() == 'function_definition' then
      local function_name = class_body:next_named_sibling()
      if helpers.node_text(function_name) == '__init__' then
        return body_child
      end
    end
  end
  return nil
end

return {
  function(node)
    local query = vim.treesitter.query.parse(
      'python',
      [[
        (function_definition
          (identifier) @qwe (#eq? @qwe "__init__")
        )
    ]]
    )
    local pt = {}
    for _, matches, _ in query:iter_matches(node, 0) do
    end

    local original_text = helpers.node_text(node)

    local class_name = nil
    local class_body = nil
    for child in node:iter_children() do
      local ntype = child:type()
      if ntype == 'identifier' then
        class_name = child
      elseif ntype == 'block' then
        class_body = child
      end
    end
    if not (class_body and class_name) then
      vim.notify('something went wrong', vim.log.levels.WARN)
      return original_text
    end

    local init_method = get_init(class_body)
  end,

  name = 'generate doc for class',
}
