defmodule LogLevel do
  def to_label(level, legacy?) when legacy? do
    cond do
      level == 0 -> :unknown
      level == 1 -> :debug
      level == 2 -> :info
      level == 3 -> :warning
      level == 4 -> :error
      level == 5 -> :unknown
      true -> :unknown
    end
  end

  def to_label(level, legacy?) when not legacy? do
    cond do
      level == 0 -> :trace
      level == 1 -> :debug
      level == 2 -> :info
      level == 3 -> :warning
      level == 4 -> :error
      level == 5 -> :fatal
      true -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    case to_label(level, legacy?) do
      useless when useless in [:error, :fatal] -> :ops
      :unknown when legacy? -> :dev1
      :unknown when not legacy? -> :dev2
      _ -> false
    end
  end
end
