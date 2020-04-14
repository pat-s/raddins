#' Reload RStudio window.
#'
#' This addin reloads the current project and also kill all open terminals.
#'
#' @export
open_github <- function() {

  repo <- desc::desc_get_field("Package")
  usethis::browse_github(repo)
}
