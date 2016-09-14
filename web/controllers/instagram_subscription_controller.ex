defmodule WeddingDay.InstagramSubscriptionController do
  use WeddingDay.Web, :controller

  alias WeddingDay.InstagramSubscription

  def user_instagram_posts(conn, params) do
    IO.puts('Post params')
    IO.inspect(params)
    conn
  end

  def instagram_sub_verfication(conn, params) do
    IO.puts('Get params')
    IO.inspect(params)
    # conn
    # |> put_flash(:info, "Redirected to posts from instagram sub verification")
    # |> redirect(to: post_path(conn, :index))
    json conn, %{status: 'ok'}
  end

  def instagram_sub_request(conn, _params) do
    url_params = [client_id: "ead4d0b7a0804193be03186cfac3b71d",
                  client_secret: "bbcefab560e94b4ebc62141d2d6649da",
                  object: "user",
                  aspect: "media",
                  verify_token: "205409548.ead4d0b.4cbbf234a1dc425a95b47576f5ab33f6",
                  access_token: "205409548.ead4d0b.4cbbf234a1dc425a95b47576f5ab33f6",
                  callback_url: "http://anna.ngrok.io/instagram_endpoint/"
                ]
    json = %{ client_id: "ead4d0b7a0804193be03186cfac3b71d",
              client_secret: "bbcefab560e94b4ebc62141d2d6649da",
              object: "user",
              aspect: "media",
              verify_token: "205409548.ead4d0b.4cbbf234a1dc425a95b47576f5ab33f6",
              access_token: "205409548.ead4d0b.4cbbf234a1dc425a95b47576f5ab33f6",
              callback_url: "http://anna.ngrok.io/instagram_endpoint/"
              } |> Poison.encode!
    # HTTPoison.post!("https://api.instagram.com/v1/subscriptions/?client_id=ead4d0b7a0804193be03186cfac3b71d&client_secret=bbcefab560e94b4ebc62141d2d6649da&object=user&aspect=media&verify_token=205409548.ead4d0b.4cbbf234a1dc425a95b47576f5ab33f6&callback_url=http://anna.ngrok.io/instagram_endpoint/", json)
    HTTPoison.post!("https://api.instagram.com/v1/subscriptions/", {:form, url_params}, %{"Content-type" => "application/x-www-form-urlencoded"})
    |> IO.inspect
    conn
    |> put_flash(:info, "Connection request sent.")
    |> redirect(to: post_path(conn, :index))
  end

end
