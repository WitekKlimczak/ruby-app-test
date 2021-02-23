# frozen_string_literal: true

class Main
  require 'log_parser'
  require 'tty-table'

  def initialize(output)
    @output = output
  end

  def run
    logs = LogParser.new('webserver.log').run
    puts 'Visits:'
    list_sorted_pages(logs, :visits_count)
    puts 'Unique visits:'
    list_sorted_pages(logs, :unique_visits_count)
  end

  def list_sorted_pages(logs, sort_param)
    logs.sort_by { |log| log.send(sort_param) }
    logs.each do |log|
      puts "#{log.address} -> #{log.send(sort_param)}"
    end
  end
end
