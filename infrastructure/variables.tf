variable "upload_directory" {
  default = "../website/"
}

variable "mime_types" {
  default = {
    htm            = "text/html"
    html           = "text/html"
    css            = "text/css"
    ttf            = "font/ttf"
    js             = "application/javascript"
    map            = "application/javascript"
    json           = "application/json"
    woff           = "font/woff"
    woff2          = "font/woff2"
    scss           = "text/css"
    jpg            = "image/jpeg"
    eot            = "application/vnd.ms-fontobject"
    php            = "application/x-httpd-php"
    svg            = "image/svg+xml"
    yml            = "text/plain"
    md             = "text/plain"
    browserslistrc = "text/plain"
    gitignore      = "text/plain"
  }
}
