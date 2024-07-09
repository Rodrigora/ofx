# frozen_string_literal: true

require 'open-uri'
require 'nokogiri'
require 'bigdecimal'

require 'kconv'

require 'ofx/configuration'
require 'ofx/errors'
require 'ofx/parser'
require 'ofx/parser/ofx102'
require 'ofx/parser/ofx103'
require 'ofx/parser/ofx211'
require 'ofx/foundation'
require 'ofx/balance'
require 'ofx/account'
require 'ofx/sign_on'
require 'ofx/status'
require 'ofx/statement'
require 'ofx/transaction'
require 'ofx/version'

def OFX(resource, &block)
  parser = OFX::Parser::Base.new(resource).parser

  if block_given?
    if block.arity == 1
      yield parser
    else
      parser.instance_eval(&block)
    end
  end

  parser
end

module OFX
  class << self
    attr_accessor :configuration
  end

  self.configuration ||= Configuration.new

  def self.configure
    yield(configuration)
  end
end
