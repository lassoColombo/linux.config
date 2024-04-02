function extractArguments(input)
  local arguments = {}
  local cleanedInput = input:gsub('f"', '"') -- Remove 'f' from the beginning
  for placeholder in cleanedInput:gmatch '{.-}' do
    local emptyPlaceholder = placeholder:gsub('[^{}]+', '') -- Replace content inside {} with empty string
    cleanedInput = cleanedInput:gsub(placeholder, emptyPlaceholder, 1) -- Replace placeholder with empty placeholder
    table.insert(arguments, emptyPlaceholder)
  end
  return cleanedInput, arguments
end

-- Test cases
local input1 = 'f"{a}/asd/asd/{b}"'
local input2 = 'f"{a}/asd/asd/{b}/asd/{c}"'
local input3 = 'f"{a}/asd/asd/{b}/asd/{c}/asd/{d}"'

local cleanedInput1, arguments1 = extractArguments(input1)
local cleanedInput2, arguments2 = extractArguments(input2)
local cleanedInput3, arguments3 = extractArguments(input3)

-- Print the cleaned inputs and extracted arguments
print('Cleaned input 1:', cleanedInput1) -- Output: "{}/asd/asd/{}"
print('Arguments in input 1:', table.concat(arguments1, ',')) -- Output: ,
print('Cleaned input 2:', cleanedInput2) -- Output: "{}/asd/asd/{}/asd/{}"
print('Arguments in input 2:', table.concat(arguments2, ',')) -- Output: ,
print('Cleaned input 3:', cleanedInput3) -- Output: "{}/asd/asd/{}/asd/{}/asd/{}"
print('Arguments in input 3:', table.concat(arguments3, ',')) -- Output: ,
