defmodule FreelancerRates do
  alias Decimal

  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do
    before_discount - before_discount * discount / 100.0
  end

  def monthly_rate(hourly_rate, discount) do
    final_amount = apply_discount(daily_rate(hourly_rate) * 22, discount)

    trunc(ceil(final_amount))
  end

  def days_in_budget(budget, hourly_rate, discount) do
    daily_amount_with_discount = apply_discount(daily_rate(hourly_rate), discount)

    Float.round(Float.floor(budget / daily_amount_with_discount, 1), 2)
  end
end
