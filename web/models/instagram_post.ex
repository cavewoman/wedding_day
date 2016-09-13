defmodule InstagramPost do
  def get_images(token) do
    tags = ["becomingmrssherman"]
    tags
    |> Enum.map(fn(x) -> get_images_from_tag(x, token) end)
    |> List.flatten
  end

  def get_images_from_tag(tag, token) do
    case HTTPoison.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?access_token=#{token}") do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body
        |> process_response_body
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end

  def process_response_body(body) do
    body
    |> Poison.decode!
    |> Map.get("data")
    |> Enum.map(fn(x) -> get_image(x) end)
  end

  def get_image(post) do
    post
    |> Map.get("images")
    |> Map.get("standard_resolution")
    |> Map.get("url")
  end
end
