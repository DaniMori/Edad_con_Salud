library(tidyverse)
library(haven)
library(waldo)

AUTOPSY_PATH <- r"(~\..\UAM\Marta Miret Garcia - Documentacion Edad con Salud\Edad con salud - Ola 4\Autopsia verbal\Cohorte_2011)"

old_dataset <- file.path(AUTOPSY_PATH, "rawdata_autopsy_c2011w4.dta")           |> read_dta()
new_dataset <- file.path(AUTOPSY_PATH, "rawdata_autopsy_c2011w4_completed.dta") |> read_dta()

compare(old_dataset, new_dataset)

compare(names(old_dataset), names(new_dataset), list_as_map = TRUE)

missing_vars <- names(old_dataset) |> setdiff(names(new_dataset))
new_vars     <- names(new_dataset) |> setdiff(names(old_dataset))

old_dataset |> left_join(new_dataset, by = "ID_ECS") |> select(ends_with(c(".x", ".y")))

old_dataset |>
  select(all_of(missing_vars)) |>
  map_chr(attr, "label") |>
  enframe("variable", "label")
