# frozen_string_literal: true

require './lib/main'

RSpec.describe Main do
  let(:io) { IO.new(IO.sysopen('/dev/null', 'w+')) }
  let(:main) { Main.new(io) }

  describe '#list_sorted_pages' do
    let(:logs) { LogParser.new('./spec/fixtures/webserver.log').run }

    let(:pages_by_visits) do
      ['/about/2 -> 90', '/contact -> 89', '/index -> 82',
       '/about -> 81', '/help_page/1 -> 80', '/home -> 78']
    end

    let(:pages_by_unique_visits) do
      ['/contact -> 23', '/index -> 23', '/help_page/1 -> 23',
       '/home -> 23', '/about/2 -> 22', '/about -> 21']
    end

    after { main.list_sorted_pages(logs, :visits_count) }

    it 'sort by visits' do
      pages_by_visits.each do |output|
        expect(io).to receive(:puts).with(output).ordered
      end
    end

    it 'sort by unique visits' do
      pages_by_visits.each do |output|
        expect(io).to receive(:puts).with(output).ordered
      end
    end
  end
end
