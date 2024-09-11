defmodule UrlShortener.Shortener.Url do
  use Ecto.Schema
  import Ecto.Changeset

  schema "urls" do
    field :code, :string
    field :long_url, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(url, attrs) do
    url
    |> cast(attrs, [:long_url])
    |> validate_required([:long_url])
    |> validate_format(:long_url, ~r{^https?://})
    |> unique_constraint(:code)
    |> unique_constraint(:long_url)
    |> put_change(:code, generate_short_code())
  end

  defp generate_short_code(length \\ 6) do
    :crypto.strong_rand_bytes(length) |> Base.url_encode64() |> binary_part(0, length)
  end
end
