defmodule Mentioner.Slack do
  use Slack

  def handle_message(message = %{type: "message"}, slack, state) do
    if Regex.run ~r/<@#{slack.me.id}>:?\sping/, message.text do
      send_message("<@#{message.user}> pong",
        message.channel, slack)
    end
    {:ok, state}
  end
  # Catch all message handler so we don't crash
  def handle_message(_message, _slack, state) do
    {:ok, state}
  end
end
