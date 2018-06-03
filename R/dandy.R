#' @importFrom R6 R6Class
#' @importFrom htmltools HTML
#'
#' @export

Dandy <- R6::R6Class("Dandy",
                   public = list(
                     styles = list(),
                     add_style = function(identifier, content){
                       self$styles[[identifier]] <- content
                     },
                     remove_style = function(identifier, content = NULL){
                       if (is.null(content)){
                         self$styles[[identifier]] <- NULL
                       } else {
                         self$styles[[identifier]][[content]] <- NULL
                       }
                     },
                     print = function(){
                      cat(HTML(c('<style type="text/css">', private$stylish(self$styles), '</style>')))
                     },
                     swag = function(){
                       HTML(c('<style type="text/css">', private$stylish(self$styles), '</style>'))
                     }
                   ),
                   private = list(
                     stylish = function(list){
                       res <- lapply(self$styles,
                                         function(x){
                                           paste(names(x), x, sep = ": ", collapse = "; ")
                                         })
                       paste(names(res), '{', res, '}', sep = " ")
                     }
                   )
)

css <- Dandy$new()

css$add_style("body", list("font-family" = "Helvetica",
                         "color" = "#24292e"))
css$add_style("h2", list("font-size" = "3 em",
                       "color" = "#911414",
                       "text-align" = "center"))
css$add_style("h3", list("font-size" = "1.5 em",
                       "color" = "#2E2E8F",
                       "text-align" = "center"))

css$hide_style("h2")
css$hide_style("h3", "color")

ui <- fluidPage(
  css$swag(),
  textInput("lol","lol", "lol"),
  textOutput("lolilol"),
  h2("lol"),
  h3("pouet")

)

server <- function(input, output, session) {
  output$lolilol <- renderText({
    input$lol
  })
}

shinyApp(ui, server)
