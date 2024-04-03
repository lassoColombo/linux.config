local helpers = require 'ts-node-action.helpers'

local function format_to_f_string(node)
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
end

local function f_string_to_format(node)
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
end

return {
  -- format string to f-string
  function(node)
    -- check that's actually an f-string
    local string_start = node
    while string_start ~= nil and string_start:type() ~= 'string_start' do
      string_start = string_start:prev_sibling()
    end
    local string_start_text = helpers.node_text(string_start)

    if string_start_text == 'f"' then
      return f_string_to_format(node)
    else
      return format_to_f_string(node)
    end
  end,

  name = 'toggle f-string',
}
