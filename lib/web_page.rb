# frozen_string_literal: true

class WebPage
  attr_reader :address, :visits

  def initialize(address)
    @address = address
    @visits = Hash.new { |hash, key| hash[key] = 0 }
  end

  def add_visit(ip)
    @visits[ip] += 1
  end

  def visits_count
    @visits.values.sum
  end

  def unique_visits_count
    @visits.keys.count
  end
end
