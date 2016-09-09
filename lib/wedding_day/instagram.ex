
defmodule WeddingDay.Instagram do
  def client_secret do
    Application.get_env(:instagram, :client_secret)
  end
  def client_id do
    Application.get_env(:instagram, :client_id)
  end
end
