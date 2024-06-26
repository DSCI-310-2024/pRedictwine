#' create_histogram
#'
#' Creates ggplot histograms with x labels, different coloured qualities, and
#' specifiable x-axis, y-axis, labels bundled into a workflow. It is then applied
#' to a workflow where the input is training data, and the workflow is used
#' alongside cowplot commands to create the visualization.
#'
#' @param df A training data frame or data frame extension (e.g. a tibble).
#' @param x The column within data_frame that should serve as the x axis.
#' @param group The column within data_frame that the histogram should be coloured by.
#' @param x_lab A string if a label for the x-axis is required. Default is "" (no axis label).
#' @param y_lab A string if a label for the y-axis is required. Default is "" (no axis label).
#' @param font_size Size of the font used in the histogram. Default is 10.5.
#'
#' @return A histogram created by ggplot.
#'  The histogram should have different colours based on the quality of wine.
#'  The x-label should always show, while the y-axis is only shown if add_y_lab = TRUE.
#'  Returned histogram should work well with cowplot so the histograms are joined as one
#'  visualization.
#'
#' @export
#'
#' @examples
#' create_histogram(df = mtcars, x = mpg, group = am,
#'                  x_lab = "Miles/(US) gallon", y_lab = "Count", font_size = 10.5)
#'
create_histogram <- function(df,
                             x,
                             group,
                             x_lab = "",
                             y_lab = "",
                             font_size = 10.5) {

  if(!is.data.frame(df)) {
    stop("`df` is not a data frame object")
  }
  
  histogram <- df %>%
    ggplot2::ggplot(ggplot2::aes(x = {{x}})) +
    ggplot2::geom_histogram(ggplot2::aes(color = {{group}}, fill = {{group}})) +
    ggplot2::xlab(x_lab) +
    ggplot2::ylab(y_lab) +
    ggplot2::theme(text = ggplot2::element_text(size=font_size),
                   legend.position="none")

  if(y_lab == "") {
    histogram <- histogram + ggplot2::theme(axis.title.y = ggplot2::element_blank())
  }

  return(histogram)
}
