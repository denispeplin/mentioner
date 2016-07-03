defmodule Mentioner do
  use Application
  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    slack_token = Application.get_env(:mentioner, Mentioner.Slack)[:token]
    if is_nil(slack_token) do
      IO.puts "The Slack Bot key is not exported! Exiting."
      System.halt 1
    end
    Mentioner.Usermap.start_link # no supervision
    children = [worker(Mentioner.Slack, [slack_token, :whatever])]
    opts = [strategy: :one_for_one, name: Mentioner.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
