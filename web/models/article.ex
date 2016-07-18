defmodule TokyoexHandsonDemo.Article do
  use TokyoexHandsonDemo.Web, :model

  schema "articles" do
    field :title, :string
    field :url, :string
    field :og_title, :string
    field :og_image, :string
    field :og_description, :string

    timestamps
  end

  @required_fields ~w(title url og_title og_image og_description)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  def exist_with_url(url) do
    Ecto.Query.from(a in __MODULE__, where: a.url == ^url)
    |> TokyoexHandsonDemo.Repo.all
    |> Enum.count > 0
  end
end
