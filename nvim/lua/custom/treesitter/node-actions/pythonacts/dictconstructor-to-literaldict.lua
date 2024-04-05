local helpers = require 'ts-node-action.helpers'

local function split_kv_pair(pair)
  local delimiter = '='
  local pos = string.find(pair, delimiter)
  local key = string.sub(pair, 1, pos - 1)
  local value = string.sub(pair, pos + 1)
  return key, value
end

return {
  function(node)
    local text = helpers.node_text(node)
    if text ~= 'dict' then
      print 'this is not a dict constructor 😥'
      return text
    end
    local arguments = node:next_sibling()
    text = helpers.node_text(arguments)
    text = text:gsub('^%((.*)%)$', '%1')
    local keys = {}
    local vals = {}
    for pair in text:gmatch '[^,]+' do
      local key, value = split_kv_pair(pair)
      table.insert(keys, key)
      table.insert(vals, value)
    end
    local res = '{'
    for i = 1, #keys - 1 do
      res = res .. '"' .. keys[i] .. '": ' .. vals[i] .. ','
    end
    res = res .. '"' .. keys[#keys] .. '": ' .. vals[#keys] .. '}'

    local parent_call = node:parent()
    return res, { target = parent_call }
  end,

  name = 'dict constructor to literal dict',
}
