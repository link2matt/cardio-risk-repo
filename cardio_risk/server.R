cardio.risk <- function (age0 = 0, gender = "", ethnicity = "", smoke0 = 0, 
          diabetes0 = 0, bprx = 0, sbp = 0, tchol0 = 0, hdl0 = 0) 
  
{

  age = 0
  age2 = 0
  int1 = 0
  int2 = 0
  int3 = 0
  int4 = 0
  int5 = 0
  tchol = 0
  hdl = 0
  sbpR0 = 0
  sbpR = 0
  sbpN0 = 0
  sbpN = 0
  smoke = 0
  diabetes = 0
  baseline = 0
  meancoef = 0
  estLDL = tchol0 - hdl0 - 30
  if (bprx == 1) {
    sbpR0 = sbp
  }
  else {
    sbpN0 = sbp
  }
  
  if (gender == "Male") {
    if (ethnicity == "w" || ethnicity == "Other" || ethnicity == 
        "h") {
      age = 12.344 * log(age0)
      age2 = 0
      tchol = 11.853 * log(tchol0)
      int1 = -2.664 * log(age0) * log(tchol0)
      hdl = -7.99 * log(hdl0)
      int2 = 1.769 * log(age0) * log(hdl0)
      if (sbpR0 > 0) {
        sbpR = 1.797 * log(sbpR0)
      }
      else {
        sbpR = 0
      }
      if (sbpN0 > 0) {
        sbpN = 1.764 * log(sbpN0)
      }
      else {
        sbpN = 0
      }
      smoke = 7.837 * smoke0
      int3 = -1.795 * log(age0) * smoke0
      diabetes = 0.658 * diabetes0
      int4 = 0
      int5 = 0
      meancoef = 61.18
      baseline = 0.9144
    }
    else {
      age = 2.469 * log(age0)
      age2 = 0
      tchol = 0.302 * log(tchol0)
      int1 = 0
      hdl = -0.307 * log(hdl0)
      int2 = 0
      if (sbpR0 > 0) {
        sbpR = 1.916 * log(sbpR0)
      }
      else {
        sbpR = 0
      }
      if (sbpN0 > 0) {
        sbpN = 1.809 * log(sbpN0)
      }
      else {
        sbpN = 0
      }
      smoke = 0.549 * smoke0
      int3 = 0
      diabetes = 0.645 * diabetes0
      int4 = 0
      int5 = 0
      meancoef = 19.54
      baseline = 0.8954
    }
  }
  
  
  if (gender == "Female") {
    if (ethnicity == "w" || ethnicity == "Other" || ethnicity == 
        "h") {
      age = -29.799 * log(age0)
      age2 = 4.884 * log(age0)^2
      tchol = 13.54 * log(tchol0)
      int1 = -3.114 * log(age0) * log(tchol0)
      hdl = -13.578 * log(hdl0)
      int2 = 3.149 * log(age0) * log(hdl0)
      if (sbpR0 > 0) {
        sbpR = 2.019 * log(sbpR0)
      }
      else {
        sbpR = 0
      }
      int3 = 0
      if (sbpN0 > 0) {
        sbpN = 1.957 * log(sbpN0)
      }
      else {
        sbpN = 0
      }
      int4 = 0
      smoke = 7.574 * smoke0
      int5 = -1.665 * log(age0) * smoke0
      diabetes = 0.661 * diabetes0
      meancoef = -29.18
      baseline = 0.9665
    }
    else {
      age = 17.114 * log(age0)
      age2 = 0
      tchol = 0.94 * log(tchol0)
      int1 = 0
      hdl = -18.92 * log(hdl0)
      int2 = 4.475 * log(age0) * log(hdl0)
      if (sbpR0 > 0) {
        sbpR = 29.291 * log(sbpR0)
      }
      else {
        sbpR = 0
      }
      if (sbpR0 > 0) {
        int3 = -6.432 * log(age0) * log(sbpR0)
      }
      else {
        int3 = 0
      }
      if (sbpN0 > 0) {
        sbpN = 27.82 * log(sbpN0)
      }
      else {
        sbpN = 0
      }
      if (sbpN0 > 0) {
        int4 = -6.087 * log(age0) * log(sbpN0)
      }
      else {
        int4 = 0
      }
      smoke = 0.691 * smoke0
      int5 = 0
      diabetes = 0.874 * diabetes0
      meancoef = 86.61
      baseline = 0.9533
    }
  }
  
  sum = age + age2 + tchol + int1 + hdl + int2 + sbpR + int3 + 
    sbpN + int4 + int5 + smoke + diabetes
  prob = round(100 * (1 - baseline^exp(sum - (meancoef))), 
               2)

    msg = paste(sprintf("%.1f", prob), "%")
 
  msg
}
  


shinyServer(
  function(input, output) {
    output$inputValue1 <- renderPrint({input$age})
    output$inputValue2 <- renderPrint({input$sex})
    output$inputValue3 <- renderPrint({input$race})
    output$inputValue4 <- renderPrint({input$smoke})
    output$inputValue5 <- renderPrint({input$systolic})
    output$prediction <- renderPrint({cardio.risk(age0 = input$age, 
                                                  gender = as.character(input$sex), 
                                                  ethnicity =  as.character(input$race), 
                                                  smoke0 = as.numeric(input$smoke), 
                                                  diabetes0 = as.numeric(input$diabetes), 
 #                                                 bprx = as.numeric(input$rx1), 
                                                  sbp = input$systolic, 
                                                  tchol0 =  input$cholesterol, 
                                                  hdl0 = input$hdl
                                                  )})
  }
)

