#' Reload RStudio window.
#'
#' This addin reloads the current project and also kill all open terminals.
#'
#' @export
reload_project <- function() {

  # kill all terminals
  rstudioapi::terminalKill(rstudioapi::terminalList())

  # Reload window
  rstudioapi::openProject()
}
