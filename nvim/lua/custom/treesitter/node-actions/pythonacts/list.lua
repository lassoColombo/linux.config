local helpers = require 'ts-node-action.helpers'

-- indents stuff inside parenthesis
local function expand_callback()
  vim.cmd 'norm vib='
end

local function expand(node)
  local opening_bracket = helpers.node_text(node:child(0))
  local res = { opening_bracket }
  local children_count = node:child_count()
  local tt = {}
  for i = 1, children_count - 3, 2 do
    local j = i + 1
    local element = node:child(i)
    local separator = node:child(j)
    table.insert(res, helpers.node_text(element) .. (helpers.node_text(separator)))
  end

  if children_count % 2 ~= 0 then
    table.insert(res, helpers.node_text(node:child(children_count - 2)))
  end

  table.insert(res, helpers.node_text(node:child(children_count - 1)))

  return res
end

local function contract(node)
  local text = helpers.node_text(node)
  local opening_bracket = table.remove(text, 1)
  local closing_bracket = table.remove(text)
  local res = table.concat(text, ' ')
  return opening_bracket .. res .. closing_bracket
end

return {
  function(node)
    if helpers.node_is_multiline(node) then
      return contract(node)
    else
      return expand(node), { callback = expand_callback }
    end
  end,

  name = 'toggle list multilineness',
}
