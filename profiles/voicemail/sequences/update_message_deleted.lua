--[[
  Update the deletion state of a message.
]]

-- The deleted state to update to.
deleted = args(1)

-- Message data.
message_number = storage("counter", "message_number")
message_id = storage("message", "id_" .. message_number)

return
{
  {
    action = "data_update",
    handler = "odbc",
    config = profile.db_config_message,
    fields = {
      __deleted = deleted,
    },
    filters = {
      __id = message_id,
    },
    update_type = "update",
  },
}

