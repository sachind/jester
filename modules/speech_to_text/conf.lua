jester.action_map.speech_to_text_from_file = {
  mod = "speech_to_text",
  handlers = {
    att = "speech_to_text_from_file_att",
    -- Google changed things so their API is not longer generally accessible.
    -- google = "speech_to_text_from_file_google",
    default = "speech_to_text_from_file_att",
  }
}

