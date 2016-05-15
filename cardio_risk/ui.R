## Assignment Developing Data Products
## Cardio Vascular Risk

shinyUI(
  pageWithSidebar(
    #Application title
    headerPanel("Cardiovascular Prediction Shiny App"),
    sidebarPanel(
      h3("Profile"),
      sliderInput('age', label = 'Age', 45, min=30,max=100,step=1),
      selectInput('sex', label = "Gender", choices = c("Female", "Male")),
      selectInput('race', label = "Please choose an ethnicity, African-American or Other than African-American", choices = c("African-American", "Other")),
      checkboxInput(inputId = "smoke",
                    label = strong("Smoker"),
                    value = FALSE),
      checkboxInput(inputId = "diabetes",
                    label = strong("Diabetic"),
                    value = FALSE),
      
#      selectInput('smoke', label = "Smoke", choices = c(0,1)),
#      selectInput('diabetes', label = "Diabetes", choices = c(0,1)),
#      selectInput('rx1', label = "Blood Pressure Medicine", choices = c("Yes", "No")),
      sliderInput('systolic', label = "Systolic Blood Pressure", 100, min = 70, max=200, step = 1),
      sliderInput('cholesterol', label = "Total Cholesterol", 150, min = 1, max=400, step = 1),   
      sliderInput('hdl', label = "HDL Cholesterol", 40, min = 1, max=100, step = 1)
#      submitButton('Submit')
    ),
    mainPanel(
      h3("Prediction Calculation"),
      p("For the entered data, the probability of a cardiovascular event in the following ten years for a person with this profile is"),
      verbatimTextOutput("prediction"),
      h3("Documentation"),
      p("This Shiny app is a student project for the Coursera Developing Data Products class.  It should not be considered a medical diagnosis."),
      p("This Shiny app is based on a funciton authored by the Github user openRules in the repo titled home. This function is intended to be used as a diagnoistic tool to evaluate the risk of a heart attack or other cardiovascular event. The probability is calculated based on research on the U.S. population."),
      p("This webpage dynamically updates as the profile is altered.  For example, increasing the age will adjust the prediction, in most case raising the probability.  Lowering the Systolic Blood Pressure will lower the probability."),
      p("African-Americans have significantly different patterns of cardiovascular risk than people of other ethnicities, such as whites or Asian-Americans, in the United States."),
      p("Clicking on the Smoker checkbox indicates the profile of a person who smokes tobacco products. Clicking on the Diabetic checkbox indicates the profile of a person who has the disease diabetes."),
      
            p()
    )
  )
)