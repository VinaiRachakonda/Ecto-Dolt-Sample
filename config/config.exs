import Config

config :ecto_blog, Decto.Repo,
  database: "decto",
  username: "root",
  password: "",
  hostname: "localhost",
  port: 3307

config :ecto_blog, ecto_repos: [Decto.Repo]
