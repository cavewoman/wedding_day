# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     WeddingDay.Repo.insert!(%WeddingDay.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias WeddingDay.Repo
alias WeddingDay.MenuItem
alias WeddingDay.Todo

# Seeds Menu Items
MenuItem.changeset(%MenuItem{}, %{section: "Starter", type: "Both", details: "Mixed young field greens, blue cheese, pecans, dice apple w/ creamy apple cider vinaigrette", name: "Mixed Field Greens Salad"}) |> Repo.insert
MenuItem.changeset(%MenuItem{}, %{section: "Starter", type: "Both", details: "Butternut squash puree with cream swirl.", name: "Butternut Squash Soup"}) |> Repo.insert
MenuItem.changeset(%MenuItem{}, %{section: "Entree", type: "Non Vegetarian", details: "Beef shoulder tenderloin with some sort of sauce.", name: "Beef Shoulder Tenderloin"}) |> Repo.insert
MenuItem.changeset(%MenuItem{}, %{section: "Entree", type: "Non Vegetarian", details: "TBD", name: "Grilled Salmon"}) |> Repo.insert
MenuItem.changeset(%MenuItem{}, %{section: "Entree", type: "Vegetarian", details: "Garlic and herb seasoned & grilled eggplant \"steak\"/portobello mushroom stack with caramelized onion topping", name: "Grilled Eggplant Steak"}) |> Repo.insert
MenuItem.changeset(%MenuItem{}, %{section: "Side", type: "Both", details: "TBD", name: "Peruvian purple mashed potatoes"}) |> Repo.insert
MenuItem.changeset(%MenuItem{}, %{section: "Side", type: "Both", details: "Green beans luxuriously tossed with almonds", name: "Haricots Verts Almandine"}) |> Repo.insert
MenuItem.changeset(%MenuItem{}, %{section: "Dessert", type: "Both", details: "Lavender Crème w/ Chambord whipped cream", name: "Lavender Crème"}) |> Repo.insert

# Seeds Todos
Todo.changeset(%Todo{}, %{name: "Take Photo for Guestbook", title: "guestbook", details: "This is located near the veranda. Take a fun picture with the instax camera, sign your name at the bottom and hang it on our frame.", image_url: "polaroid.jpeg"}) |> Repo.insert
Todo.changeset(%Todo{}, %{name: "Eat a biscuit", title: "biscuit", details: "Biscuits with fixin's will be served on the veranda between the ceremony and reception", image_url: "biscuit.jpeg"}) |> Repo.insert
Todo.changeset(%Todo{}, %{name: "Grab a Refreshment", title: "refreshment", details: "Beer and wine as well as apple cider will be served on the veranda between the ceremony and reception.", image_url: "cheers.jpeg"}) |> Repo.insert
