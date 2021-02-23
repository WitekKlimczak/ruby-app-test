# frozen_string_literal: true

class LogParser
  require 'web_page'

  def initialize(file)
    @file = File.open(file)
    @logs = Hash.new { |hash, key| hash[key] = WebPage.new(key) }
  end

  def run
    @file.each do |line|
      address, ip = line.split
      @logs[address].add_visit(ip)
    end
    @logs.values
  end
end
