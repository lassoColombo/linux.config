local helpers = require 'ts-node-action.helpers'

local function split_kv_pair(pair)
  local delimiter = ':'
  local pos = string.find(pair, delimiter)
  local key = string.sub(pair, 1, pos - 1)
  local value = string.sub(pair, pos + 1)
  return key, value
end

return {
  function(node)
    local keys = {}
    local vals = {}
    local tt = {}
    for pair in node:iter_children() do
      if pair:type() == 'pair' then
        table.insert(tt, helpers.node_text(pair))
        local key, value = split_kv_pair(helpers.node_text(pair))
        local stripped_key = key:gsub('^"(.-)"$', '%1')
        local stripped_value = value:match '^%s*(.-)%s*$'
        table.insert(keys, stripped_key)
        table.insert(vals, stripped_value)
      end
    end

    local args = '('
    for i = 1, #keys - 1 do
      args = args .. keys[i] .. '=' .. vals[i] .. ','
    end
    args = args .. keys[#keys] .. '=' .. vals[#keys] .. ')'

    return 'dict' .. args
  end,

  name = 'literal dict to dict constructor',
}
