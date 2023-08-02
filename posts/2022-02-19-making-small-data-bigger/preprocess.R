unique_loans_df <- 
  tibble::tibble(
    `Loan ID` = 1001:1008, 
    `Debt Coverage Ratio` = rnorm(
      n = 8, 
      mean = 1.5, 
      sd = 0.5
    ) |> round(3), 
    `Credit Score` = rnorm(
      n = 8, 
      mean = 715, 
      sd = 30
    ) |> round(0), 
    `Industry Outlook` = sample(
      c("Poor", "Fair", "Good", "Above Average", "Excellent"), 
      size = 8, 
      replace = TRUE
    ), 
    Outcome = sample(
      c("Paid in Full", "Default"), 
      size = 8, 
      replace = TRUE, 
      prob = c(0.7, 0.3)
    )
  ) |> 
  dplyr::mutate(
    Outcome = ifelse(`Loan ID` == 1002, "Default", Outcome)
  )

longitudinal_df <- 
  tibble::tibble(
    `Loan ID` = c(rep(1001, 2), 1002, rep(1003, 2)), 
    `Debt Coverage Ratio` = rnorm(
      n = 5, 
      mean = 1.5, 
      sd = 0.5
    ) |> round(3), 
    `Credit Score` = rnorm(
      n = 5, 
      mean = 715, 
      sd = 30
    ) |> round(0), 
    `Industry Outlook` = sample(
      c("Poor", "Fair", "Good", "Above Average", "Excellent"), 
      size = 5, 
      replace = TRUE
    ), 
    Status = "Current"
  ) |> 
  dplyr::bind_rows(
    unique_loans_df |> 
      dplyr::filter(`Loan ID` %in% 1001:1003) |> 
      dplyr::rename(Status = Outcome)
  ) |> 
  dplyr::arrange(`Loan ID`) |> 
  dplyr::mutate(Date = c(
    seq.Date(
      from = as.Date("2021-06-01"), to = as.Date("2021-08-01"), by = "month"
    ), 
    seq.Date(
      from = as.Date("2021-02-01"), to = as.Date("2021-03-01"), by = "month"
    ), 
    seq.Date(
      from = as.Date("2021-09-01"), to = as.Date("2021-11-01"), by = "month"
    )
  )) |> 
  dplyr::arrange(`Loan ID`, Date) |> 
  dplyr::relocate(Date, .after = `Loan ID`)
  
  
  
  