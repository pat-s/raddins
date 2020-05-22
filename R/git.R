#' Git Push
#'
#' Calls `gert::git_push()`
#'
#' @export
git_push <- function() {

  gert::git_push()
}

#' Stage the current file
#'
#' @export
git_add_current_file <- function() {

  # Get active document context
  file <- rstudioapi::getActiveDocumentContext()$path
  # get current project name
  proj_name <- basename(suppressMessages(usethis::proj_path()))
  # create relative path
  path_relative <- strsplit(file, paste0(proj_name, "/"))[[1]][2]
  gert::git_add(path_relative)
}

#' Stage and commit the current file
#'
#' @export
git_commit_current_file <- function() {

  # Get active document context
  file <- rstudioapi::getActiveDocumentContext()$path
  # get current project name
  proj_name <- basename(suppressMessages(usethis::proj_path()))
  # create relative path
  path_relative <- strsplit(file, paste0(proj_name, "/"))[[1]][2]

  commit_message <- readline(prompt = "Enter git commit message: ")
  gert::git_add(path_relative)
  gert::git_commit(message = commit_message)
}

#' Commit all staged files
#'
#' @export
git_commit <- function() {

  commit_message <- readline(prompt = "Enter git commit message: ")
  gert::git_commit(message = commit_message)
}
