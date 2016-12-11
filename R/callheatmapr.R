#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
callheatmapr <- function(data, start, domain = "hour", subDomain = "min", range = 12,
                         cellSize = 10, cellPadding = 2, cellRadius = 0,
                         domainGutter = 2, domainMargin = rep(0, 4),
                         verticalOrientation = F, tooltip = F,
                         weekStartOnMonday = T, legend = seq(10, 40, 10),
                         width = NULL, height = NULL, elementId = NULL) {

  # forward options using x
  x = list(
    data = data,
    timestamp_start = start,
    domain = domain,
    subDomain = subDomain,
    range = range,
    cellSize = cellSize,
    cellPadding = cellPadding,
    cellRadius = cellRadius,
    domainGutter = domainGutter,
    domainMargin = domainMargin,
    verticalOrientation = verticalOrientation,
    tooltip = tooltip,
    weekStartOnMonday = weekStartOnMonday,
    legend = legend
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'callheatmapr',
    x,
    width = width,
    height = height,
    package = 'calheatmapr',
    elementId = elementId
  )
}

#' Shiny bindings for callheatmapr
#'
#' Output and render functions for using callheatmapr within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a callheatmapr
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name callheatmapr-shiny
#'
#' @export
callheatmaprOutput <- function(outputId, width = '100%', height = '200px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'callheatmapr', width, height, package = 'calheatmapr')
}

#' @rdname callheatmapr-shiny
#' @export
renderCallheatmapr <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, callheatmaprOutput, env, quoted = TRUE)
}
