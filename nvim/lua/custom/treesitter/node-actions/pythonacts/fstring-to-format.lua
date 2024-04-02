local helpers = require 'ts-node-action.helpers'

return {
  -- f-string to format string
  function(node)
    local template_text = helpers.node_text(node)

    -- check that's actually an f-string
    local string_start = node
    while string_start ~= nil and string_start:type() ~= 'string_start' do
      string_start = string_start:prev_sibling()
    end
    local string_start_text = helpers.node_text(string_start)
    if not string_start_text == 'f"' then
      vim.notify('this is not a python f-string 😥', vim.log.levels.WARN)
    end

    -- find the parent string node
    local string_node = node
    while string_node ~= nil and string_node:type() ~= 'string' do
      string_node = string_node:parent()
    end
    if string_node == nil then
      vim.notify('cannot appy this method here 😥', vim.log.levels.WARN)
      return
    end

    local string_text = helpers.node_text(string_node)

    -- extract arguments from {} placeholders
    local fstring_srgs = {}
    for argument in string_text:gmatch '{(.-)}' do
      table.insert(fstring_srgs, argument)
    end

    -- create arguments for the format function (a,b,c)
    local format_args = '('
    for i, arg in ipairs(fstring_srgs) do
      format_args = format_args .. arg
      if i < #fstring_srgs then
        format_args = format_args .. ','
      end
    end
    format_args = format_args .. ')'

    local result = string_text:gsub('f"', '"')
    for placeholder in result:gmatch '{.-}' do
      local emptyPlaceholder = placeholder:gsub('[^{}]+', '')
      result = result:gsub(placeholder, emptyPlaceholder, 1)
    end

    result = result .. '.format' .. format_args

    return result, { target = string_node }
  end,

  name = 'f-string to format',
}
