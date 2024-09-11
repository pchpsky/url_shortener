defmodule UrlShortener.ShortenerFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `UrlShortener.Shortener` context.
  """

  @doc """
  Generate a url.
  """
  def url_fixture(attrs \\ %{}) do
    {:ok, url} =
      attrs
      |> Enum.into(%{
        code: "some code",
        long_url: "some long_url"
      })
      |> UrlShortener.Shortener.create_url()

    url
  end
end
