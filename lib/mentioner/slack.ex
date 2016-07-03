defmodule Mentioner.Slack do
  use Slack

  def handle_message(message = %{type: "message"}, slack, state) do
    IO.puts inspect(message)
    cond do
      Regex.run ~r/<@#{slack.me.id}>:?\sping/, message.text ->
        send_message("<@#{message.user}> pong", message.channel, slack)
      parser_data = Regex.run(~r/<@#{slack.me.id}>:?\ssubscribe ([^ ]+)/, message.text) ->
        [_, github_username] = parser_data
        Mentioner.Usermap.put(github_username, message.user)
        send_message("<@#{message.user}> subscribed to #{github_username}", message.channel, slack)
      parser_data = Regex.run(~r/Commit.*branch by ([^ ]+) ([^ ]+) /, message.text) ->
        [_, username, result] = parser_data
        user = Mentioner.Usermap.get username
        if result == "failed" && user do
          send_message("<@#{user}> :point_up_2:", message.channel, slack)
        end
      true ->
        true
    end
    {:ok, state}
  end
  # Catch all message handler so we don't crash
  def handle_message(_message, _slack, state) do
    {:ok, state}
  end
end
