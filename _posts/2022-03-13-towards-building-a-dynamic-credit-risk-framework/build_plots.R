

# Build chart showing PD curve for new loan
set.seed(35)
pd <- rexp(30) |> sort()

df <- data.frame(
  Year = as.character(2022:2026),
  pd = pd[1:5]
)

new_loan_plot <- df |>
  echarts4r::e_charts(Year) |> 
  echarts4r::e_area(pd, smooth = TRUE, name = "Probability of Default") |> 
  echarts4r::e_legend(show = FALSE) |> 
  echarts4r::e_title(
    text = "Loan #1234 (At Origination)", 
    subtext = "Estimated Probability of Default over Lifetime (5-Year Term)"
  ) |> 
  echarts4r::e_axis_labels(x = "Year") |> 
  echarts4r::e_y_axis(
    formatter = echarts4r::e_axis_formatter(style = "percent")
  ) |> 
  echarts4r::e_tooltip(
    trigger = "axis", 
    formatter = echarts4r::e_tooltip_pointer_formatter(
      style = "percent", 
      digits = 1
    )
  )

htmlwidgets::saveWidget(widget = new_loan_plot, file = "new_loan_plot.html")


# Build chart showing PD curve for same loan, 2 years later
set.seed(53)
pd <- rexp(30) |> sort()

df <- data.frame(
  Year = as.character(2024:2026),
  pd = pd[3:5]
)

existing_loan_plot <- df |>
  echarts4r::e_charts(Year) |> 
  echarts4r::e_area(pd, smooth = TRUE, name = "Probability of Default") |> 
  echarts4r::e_legend(show = FALSE) |> 
  echarts4r::e_title(
    text = "Loan #1234 (Two Years Later)", 
    subtext = "Estimated Probability of Default over Lifetime (5-Year Term)"
  ) |> 
  echarts4r::e_axis_labels(x = "Year") |> 
  echarts4r::e_y_axis(
    formatter = echarts4r::e_axis_formatter(style = "percent")
  ) |> 
  echarts4r::e_tooltip(
    trigger = "axis", 
    formatter = echarts4r::e_tooltip_pointer_formatter(
      style = "percent", 
      digits = 1
    )
  )

htmlwidgets::saveWidget(
  widget = existing_loan_plot, 
  file = "existing_loan_plot.html"
)
