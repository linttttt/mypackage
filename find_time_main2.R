source("support/find_time.R", encoding = "UTF-8")
#survey <- googlesheets4::read_sheet(
#  ss="https://docs.google.com/spreadsheets/d/1LaRZTVUWxC7dEk8UWTPqpiZYPxA_NmmMhSVbaXLbGJU/edit#gid=695880922"
#)
library(readr)
survey <- read_csv("C:/Users/user/Downloads/find_time - Sheet1.csv")

# test divide_byChosenSlots function
survey$`平日（每個時段均為一小時，除5,6節為兩小時） [3/24(四)]` |>
  divide_byChosenSlots() -> responseByChosenSlots

# obtain list of each day each slot's student names
survey[5:13] |>
  purrr::map(
    divide_byChosenSlots
  ) -> responseByDayBychosenSlots
responseByDayBychosenSlots[1:9] |>
  purrr::map(
    length
  ) ->dd

lengthResponse <- vector("list", length(responseByDayBychosenSlots))
maxResponse <- vector("integer", length(responseByDayBychosenSlots))
for(.x in seq_along(responseByDayBychosenSlots)){
  lengthResponse[[.x]] <- vector("integer", length(responseByDayBychosenSlots[[.x]]))
  for(.y in seq_along(responseByDayBychosenSlots[[.x]])){
    lengthResponse[[.x]][[.y]] <- length(responseByDayBychosenSlots[[.x]][[.y]])

  }
  maxResponse[[.x]] <- max(lengthResponse[[.x]])
}
lengthResponse[which.max(maxResponse)]
#responseByDayBychosenSlots[[5]][which.max(lengthResponse[[5]])]
