defmodule Mentioner.Slack do
  use Slack

  @doc """
  Handling messages from Slack chat.
  """
  def handle_message(message = %{attachments: [attachment | _tail]}, slack, state) do
    IO.puts inspect(attachment)
    with [_, username, result] <- Regex.run(~r/Commit.*branch by (.+) (passed|failed) /, attachment.fallback) do
      user = Mentioner.Usermap.get username
      if result == "failed" && user do
        send_message("<@#{user}> :point_up_2:", message.channel, slack)
      end
    end
    { :ok, state }
  end
  def handle_message(message = %{type: "message"}, slack, state) do
    IO.puts inspect(message)
    with [_, command, params] <- Regex.run ~r/<@#{slack.me.id}>:?\s([^ ]+)\s?(.*)/, message.text do
      handle_command(command, params, message, slack)
    end
    {:ok, state}
  end
  # Catch all message handler so we don't crash
  def handle_message(_message, _slack, state) do
    {:ok, state}
  end

  @doc """
  Handle direct commands.
  """
  def handle_command("ping", _, message, slack) do
    send_message("<@#{message.user}> pong", message.channel, slack)
  end
  def handle_command("subscribe", gitlab_username, message, slack) do
    gitlab_username |> String.strip |> Mentioner.Usermap.put(message.user)
    send_message("<@#{message.user}> subscribed to #{gitlab_username}", message.channel, slack)
  end
end
