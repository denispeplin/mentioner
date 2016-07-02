# Mentioner

Mention chat users

## Installation

* Create your chat bot (with name `@mentioner` for example), and obtain its key.
You can do it on here: https://your-team.slack.com/apps/manage/custom-integrations.
* Copy `.env.sample` to `.env` and add your chat bot's key there.
* Perform `source .env` to export chat bot key to ENV.
* Run chat bot with `iex -S mix`.
* Create a channel, invite bot there, and say `@mentioner ping`. It will respond to you with `pong`.

## Credits

Credit for bot sample goes to [this article](https://medium.com/carwow-product-engineering/getting-started-writing-a-slack-bot-with-elixir-b8877072f038#.vkn5wb6h6).
