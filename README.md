# raddins

Personal RStudio addins and convenience functions.

The main purpose of addins is to use them in combination with keybindings.

## Examples

| Name                | Effect                                                                                     | Example Keybinding |
|---------------------|--------------------------------------------------------------------------------------------|--------------------|
| View Object         | Opens the object under the cursor in RStudio                                               | CTRL + Shift + V   |
| Open GitHub         | Opens the GitHub repo of the active project (if there is one)                              | CMD + Shift + G    |
| git pull            | Pulls from git (and prunes branches)                                                       | Alt + Shift + P    |
| git push            | Pushes to git                                                                              | CTRL + Shift + P   |
| git add             | Stages the currently active file                                                           | CTRL + Shift + A   |
| git status          | Executes `gert::git_status()` in the console                                               | CTRL + Shift + S   |
| git commit          | Executes `gert::git_commit()` with an interactive commit message popup                     | CTRL + Shift + C   |
| Reload RStudio      | Reloads RStudio and clears all Terminals                                                   | Cmd + R            |
| Insert dashes to 80 | Inserts dashes until column 80 in the editor (which creates a heading in the outline view) | CTRL + 8           |

For example, binding the "View Object" addin to `CTRL + Shift + V` opens the respective object under the cursor in RStudio.

## Installation

``` r
remotes::install_github("pat-s/raddins")
```

Please note that the 'raddins' project is released with a [Contributor Code of Conduct](.github/CODE_OF_CONDUCT.md). By contributing to this project, you agree to abide by its terms.

## Acknowledgment

The "Insert dashes to 80" addin was borrowed from [mine-cetinkaya-rundel/addmins](https://github.com/mine-cetinkaya-rundel/addmins):

`rs_get_symbol_at_cursor` was borrowed from [{drake}](https://github.com/ropensci-books/drake).

## Syncing RStudio settings across machines/RStudio workbench installs

If you find yourself working on different machines or in RStudio Workbench instances, you often want to have the same settings across all of these RStudio instances.

Copying multiple config files can be tiring - have a look at [pat-s/rstudioSettings](https://github.com/pat-s/rstudioSettings) for a programmatic approach.
