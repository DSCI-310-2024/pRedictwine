# creating a simple dataset

simple_dataset <- data.frame(speed = cars$speed,
                             group = c(rep("A", 5), rep("B", 10), rep("C", 10), rep("D", 10), rep("E", 10), rep("F", 5)))

# creating simple histogram
simple_histogram <- simple_dataset %>%
  ggplot2::ggplot(ggplot2::aes(x = speed)) +
  ggplot2::geom_histogram(ggplot2::aes(color = group, fill = group)) +
  ggplot2::xlab("Speed") +
  ggplot2::ylab("Count") +
  ggplot2::theme(text = ggplot2::element_text(size=12.5),
                 legend.position="none")

# create simple histogram but with default settings
simple_histogram_default_settings <- simple_dataset %>%
  ggplot2::ggplot(ggplot2::aes(x = speed)) +
  ggplot2::geom_histogram(ggplot2::aes(color = group, fill = group)) +
  ggplot2::xlab("") +
  ggplot2::ylab("") +
  ggplot2::theme(text = ggplot2::element_text(size=10.5),
                 legend.position="none",
                 axis.title.y = ggplot2::element_blank())
