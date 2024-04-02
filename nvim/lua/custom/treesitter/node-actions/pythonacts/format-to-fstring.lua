local helpers = require 'ts-node-action.helpers'

return {
  -- format string to f-string
  function(node)
    local template_text = helpers.node_text(node)

    -- find the parent call node
    while node ~= nil and node:type() ~= 'call' do
      node = node:parent()
    end
    if node == nil then
      vim.notify('cannot appy this method here 😥', vim.log.levels.WARN)
      return
    end
    -- check if the call is a format function
    local call_text = helpers.node_text(node)
    if not string.find(call_text, '%.format%(') then
      vim.notify('this is not a python format-string 😥', vim.log.levels.WARN)
      return
    end

    -- find the arguments of the function
    local arguments = nil
    for children, name in node:iter_children() do
      if name == 'arguments' then
        arguments = children
        break
      end
    end

    local function extract_arguments(str)
      local args = {}
      -- Match everything inside parentheses and iterate through the matches
      for arg in str:gmatch '%((.-)%)' do
        -- Split the matched string by comma and add each argument to the table
        for match in arg:gmatch '[^,%s]+' do
          table.insert(args, match)
        end
      end
      return args -- Return the table of extracted arguments
    end

    arguments = extract_arguments(helpers.node_text(arguments))

    local i = 1
    local result = template_text:gsub('{}', function()
      local replacement = arguments[i]
      replacement = '{' .. replacement .. '}'
      i = i + 1
      return replacement
    end)

    result = 'f"' .. result .. '"'

    return result, { target = node }
  end,

  name = 'format to f-string',
}
