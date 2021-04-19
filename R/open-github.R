#' Open GitHub repo of active project
#'
#' @export
open_github <- function() {

  repo <- desc::desc_get_field("Package")
  usethis::browse_github(repo)
}
