defmodule Decto.Repo do
  use Ecto.Repo,
    otp_app: :ecto_blog,
    adapter: Ecto.Adapters.MyXQL
end

defmodule Decto.Person do
  use Ecto.Schema

  schema "people" do
    field :first_name, :string
    field :last_name, :string
    field :age, :integer
  end
end

defmodule Decto.Branch do
  use Ecto.Schema
  alias Decto.{Repo}

  @primary_key {:name, :string, autogenerate: :false}
  schema "dolt_branches" do
    field :hash, :string
    field :latest_committer, :string
    field :latest_committer_email, :string
    field :latest_commit_date, :utc_datetime
    field :latest_commit_message, :string
  end

  def active_branch() do
    Repo.query!("SELECT active_branch();")
  end

  def checkout_new(branch) do
    Repo.query!("SELECT DOLT_CHECKOUT('-b', '#{branch}');")
  end

  def checkout_existing(branch) do
    Repo.query!("SELECT DOLT_CHECKOUT('#{branch}');")
  end

  def merge(branch) do
    Repo.query!("SELECT DOLT_MERGE('#{branch}');")
  end

end

defmodule Decto.Commit do
  use Ecto.Schema
  alias Decto.{Repo}

  @primary_key {:commit_hash, :string, autogenerate: :false}
  schema "dolt_log" do
    field :committer, :string
    field :email, :string
    field :date, :utc_datetime
    field :message, :string
  end

  def commit(message) do
    Repo.query!("SELECT DOLT_COMMIT('-a', '-m', '#{message}');")
  end

end

defmodule Decto.App do
  # Decto.Repo.start_link()
  alias Decto.{Repo, Person}

  def insertPerson(first_name, last_name, age) do
    person = %Person{first_name: first_name, last_name: last_name, age: age}
    Repo.insert(person)
  end
end
