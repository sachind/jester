--[[
  Email a message.
]]

-- Message data.
mailbox = storage("message_info", "mailbox")
recording_name = storage("message_info", "recording_name")
timestamp = storage("message_info", "timestamp")
caller_id_number = storage("message_info", "caller_id_number")
caller_id_name = storage("message_info", "caller_id_name")

-- Mailbox settings.
email = storage("mailbox_settings_message", "email")
email_template = storage("mailbox_settings_message", "email_template")
timezone = storage("mailbox_settings_message", "default_timezone")

-- Formatted date.
formatted_date = storage("format", "formatted_date")

return
{
  {
    action = "format_date",
    storage_key = "formatted_date",
    timestamp = timestamp,
    timezone = timezone,
    format = profile.email_date_format,
  },
  {
    action = "email",
    -- Attachments may or may not be allowed by the template used for the
    -- message, but always include it so it's available.
    attachments = {
      {
        filetype = "audio/x-wav",
        filename = "message.wav",
        filepath = profile.temp_recording_dir .. "/" .. recording_name,
      }
    },
    from = profile.email_from_address,
    to = email,
    template = email_template,
    server = profile.email_server,
    port = profile.email_port,
    tokens = {
      mailbox = mailbox,
      datetime = formatted_date,
      caller_id_number = caller_id_number,
      caller_id_name = caller_id_name,
    },
  },
}
