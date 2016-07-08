# Mentioner

Mention chat users

## Installation

* [Install Elixir](http://elixir-lang.org/install.html).
* Create your chat bot (with name `@mentioner` for example), and obtain its key.
You can do it here: https://your-team.slack.com/apps/manage/custom-integrations.
* Copy `.env.sample` to `.env` and add your chat bot's key.
* Perform `source .env` to export chat bot key to ENV.
* Run chat bot with `iex -S mix`.
* Invite bot into Gitlab CI channel, and say `@mentioner ping`. It will respond to you with `pong`.
* Subscribe to mentions, sending "@mentioner subscribe gitlab_username".
The `unsubscribe` command is also present.
* Bot will mention you on CI failures.

## Credits

Credit for bot sample goes to [this article](https://medium.com/carwow-product-engineering/getting-started-writing-a-slack-bot-with-elixir-b8877072f038#.vkn5wb6h6).
