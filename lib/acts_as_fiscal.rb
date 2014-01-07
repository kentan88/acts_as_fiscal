require 'date'
require 'active_support'
require 'active_support/core_ext'
require 'acts_as_fiscal/core'

Date.send(:include, ActsAsFiscal::Core)
Time.send(:include, ActsAsFiscal::Core)