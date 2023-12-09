defmodule BirdCount do
  def today(list) do
    list
    |> Enum.at(0)
  end

  def increment_day_count([]), do: [1]

  def increment_day_count(list) do
    [today(list) + 1 | tl(list)]
  end

  def has_day_without_birds?(list) do
    Enum.any?(list, fn el -> el == 0 end)
  end

  def total(list) do
    Enum.sum(list)
  end

  def busy_days(list) do
    list
    |> Enum.filter(fn bc -> bc >= 5 end)
    |> Enum.count()
  end
end
