define tmpreaper::manageddir (
  $logdeleted   = "false"
  $force        = "false"
  $delay        = "false"
  $runtime      = "false"
  $mtime        = "false"
  $ctime        = "false"
  $symlinks     = "false"
  $all          = "false"
  $protect      = "false" 
) {
  include ::tmpreaper::install

}
