defmodule UrlShortenerWeb.PageController do
  use UrlShortenerWeb, :controller

  def show(conn, _params) do
    code = conn.params["code"]

    case UrlShortener.Shortener.get_original_url(code) do
      {:ok, url} ->
        redirect(conn, external: url)

      {:error, :not_found} ->
        conn
        |> put_status(:not_found)
        |> render(UrlShortenerWeb.ErrorHTML, "404.html")
    end
  end
end
