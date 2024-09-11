defmodule UrlShortener.Repo.Migrations.CreateUrls do
  use Ecto.Migration

  def change do
    create table(:urls) do
      add :long_url, :string
      add :code, :string

      timestamps(type: :utc_datetime)
    end

    create unique_index(:urls, [:code])
    create unique_index(:urls, [:long_url])
  end
end
