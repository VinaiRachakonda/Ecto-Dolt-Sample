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


defmodule Decto.App do
  # Decto.Repo.start_link()
  alias Decto.{Repo, Person}

  def commit(message) do
    Repo.query!("SELECT DOLT_COMMIT('-a', '-m', '#{message}');")
  end

  def insertPerson(first_name, last_name, age) do
    person = %Person{first_name: first_name, last_name: last_name, age: age}
    Repo.insert(person)
  end
end
