return
{
  {
    action = "play_phrase",
    phrase = "forward_options",
    keys = {
      ["1"] = "forward_message prepend",
      ["2"] = "forward_message",
      ["*"] = "message_options",
    },
    repetitions = profile.menu_repititions,
    wait = profile.menu_replay_wait,
  },
  {
    action = "call_sequence",
    sequence = "exit"
  },
}
