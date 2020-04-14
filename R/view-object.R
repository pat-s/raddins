#' View object under cursor.
#'
#' View the object under cursor in RStudio
#'
#' @export
view_object <- function(context = NULL) {
  requireNamespace("rstudioapi", quietly = TRUE)
  context <- rstudioapi::getActiveDocumentContext()
  target <- rs_get_symbol_at_cursor(context)
  if (is.null(target)) {
    return()
  }
  cli::cli_alert("Viewing object {.code {target}} in RStudio.")
  View(target)
}

# borrowed from drake: https://github.com/ropensci/drake/blob/85ea21fc7d3ab2a0b80b3206adfece5be698c9c9/R/rstudio.R
rs_get_symbol_at_cursor <- function(context) {
  if (identical(context$id, "#console")) {
    return(NULL)
  }
  cursor_pos <- context$selection[[1]]$range$start
  cursor_line <- cursor_pos[1]
  cursor_column <- cursor_pos[2]
  r_symbol_pattern <- "[.A-Za-z][.A-Za-z0-9_]+"
  line_symbols <- gregexpr(
    text = context$contents[cursor_line],
    pattern = r_symbol_pattern
  )
  match_starts <- line_symbols[[1]]
  match_ends <- match_starts + attr(x = line_symbols[[1]], "match.length") - 1
  match_index <- which(
    cursor_column >= match_starts &
      cursor_column <= match_ends
  )
  if (length(match_index) == 0) {
    cli_msg(
      "Could not find object name at cursor position.",
      cli_sym = cli::col_red(cli::symbol$cross)
    )
    return(NULL)
  }
  substr(
    context$contents[cursor_line],
    start = match_starts[match_index],
    stop = match_ends[match_index]
  )
}
