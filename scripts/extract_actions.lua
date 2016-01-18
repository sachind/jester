--- Extracts Jester module actions using ldoc.
--
-- This script extracts a simple map of all Jester actions into a small module
-- that can be used by other modules/scripts needing a global map which
-- includes all parameters and their value types.
--
-- To re-generate the map, run the following from the root Jester directory:
-- <code>ldoc --filter scripts.extract_actions.filter .</code>
--
-- @script extract_actions.lua
-- @author Chad Phillips
-- @copyright 2011-2015 Chad Phillips

local filename = "action_map.lua"

local output = [[
--- This module represents Jester actions as extracted from Jester using ldoc.
--
-- It is a simple map of all actions, their parameters (minus the action
-- itself), and what value type the parameter accepts.
--
-- @module action_map
-- @author Chad Phillips
-- @copyright 2011-2015 Chad Phillips

return {
]]

return {
  filter = function (t)
    local data = {}
    for _, mod in ipairs(t) do
      for _, item in ipairs(mod.items) do
        if item.type == 'action' then
          local action = item.name
          output = output .. "  " .. action .. " = {\n"
          --[[
          print("------------")
          for k, v in pairs(item) do
           print(k, v)
          end
          print("------------")
          for k, v in pairs(item.modifiers.param.action) do
           print(k, v)
          end
          print("------------")
          ]]
          for _, param in ipairs(item.params) do
            if param ~= "action" and param ~= "handler" then
              output = output .. "    " .. param .. [[ = "]] .. item.modifiers.param[param].type .. [[",]] .. "\n"
            end
          end
          output = output .. "  },\n"
        end
      end
    end
    output = output .. "}"
    local file, err = io.open(filename, "wb")
    if err then print(err) end
    file:write(output)
    file:close()
    print ("actions extracted to " .. filename);
  end
}