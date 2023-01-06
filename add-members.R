library(googlesheets4)
gs4_auth("florian.prive.21@gmail.com")

members_to_add <- read_sheet("1qdG7PPlRCAU8L6Hhq1D2zT0q9LWDUzBfq7mIzz_6Dm8",
                             skip = 6, n_max = 100)[-1, ]

n <- nrow(members_to_add)
if (n > 0) {
  # add new members to true list
  sheet_append("1WyfmLfoAQUP2iRogqcOfYA9Hum7DT0BcVyTtei_6Xjw", members_to_add)
  # remove them from the temp add list
  range_delete("1qdG7PPlRCAU8L6Hhq1D2zT0q9LWDUzBfq7mIzz_6Dm8",
               range = cell_rows(8 + seq_len(n)))
} else {
  message("No new member to add!")
}
