# frozen_string_literal: true

class Main
  require 'log_parser'

  def initialize(output)
    @output = output
  end

  def run
    logs = LogParser.new(ARGV[0]).run
    @output.puts 'Visits:'
    list_sorted_pages(logs, :visits_count)
    @output.puts 'Unique visits:'
    list_sorted_pages(logs, :unique_visits_count)
  end

  def list_sorted_pages(logs, sort_param)
    logs.sort_by! { |log| log.send(sort_param) }
    logs.reverse_each do |log|
      @output.puts "#{log.address} -> #{log.send(sort_param)}"
    end
  end
end
