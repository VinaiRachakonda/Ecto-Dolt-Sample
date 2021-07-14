defmodule Decto.Repo do
  use Ecto.Repo,
    otp_app: :ecto_blog,
    adapter: Ecto.Adapters.MyXQL
end
