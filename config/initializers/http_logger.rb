require 'http_logger'

#if Rails.env.development?
  HttpLogger.colorize = true
  HttpLogger.log_headers = true
#end