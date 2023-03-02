library(waldo)
library(RStata)
library(haven)
library(tidyverse)
library(lubridate)
library(labelled)

# Configure Stata:
options(RStata.StataPath = "\"C:\\Program Files (x86)\\Stata15\\StataSE-64\"")
options(RStata.StataVersion = 15)

# First save to Stata 13 to make sure the UTF-8 coding is properly read:
stata(src = "
use \"C:/Users/Mori.P16/UAM/Marta Miret Garcia - Bases de datos maestras Edad con Salud/Ola_2/history/snapshot_2022-05-09.dta\"
saveold temp.dta, version(13)
")

# Read datasets:
HISTORY_DATAPATH <- "temp.dta"
CURRENT_DATAPATH <- r"(C:\Users\Mori.P16\UAM\Marta Miret Garcia - Bases de datos maestras Edad con Salud\Ola_2\rawdata_c2011w2.dta)"

history_data <- HISTORY_DATAPATH |> read_stata()
current_data <- CURRENT_DATAPATH |> read_stata()

file.remove("temp.dta")

# Check differences among datasets:

# var_names <- history_data |>
#   select(-ID_ECS)           |>
#   colnames()                |>
#   set_names()
#
# diff_values <- var_names |> map_dfr(
#   ~{
#     history_var <- history_data |> select(ID_ECS, old = !!sym(.x))
#     current_var <- current_data |> select(ID_ECS, new = !!sym(.x))
#
#     full_join(history_var, current_var, by = "ID_ECS")   |>
#       filter((old != new) | (is.na(old) != is.na(new))) |>
#       mutate(
#         across(
#           -ID_ECS,
#           ~if (is.labelled(.)) as_factor(.) else as.character(.) |> as_factor()
#         )
#       )
#   },
#   .id = "Variable"
# )
#
# time_vars <- current_data |> select(where(is.timepoint)) |> colnames()
#
# diff_values_filter <- diff_values |> filter(
#   !Variable %in% time_vars,
#   !(old == " " & new == ""),
# )

##All the values have been checked to match, except for time variables (which were updated):

# Check attribute matches:

# history_attributes <- history_data |> remove_var_label() |> map(attributes)
# current_attributes <- current_data |> remove_var_label() |> map(attributes)
# compare(history_attributes, current_attributes)

## All attributes match, except for the missing labels and the updated time vars


# (Missing) labels are copied into the current dataset:
current_data <- current_data |> copy_labels_from(history_data)

# The dataset is saved in its path:
current_data |> write_dta(CURRENT_DATAPATH, version = 13)
