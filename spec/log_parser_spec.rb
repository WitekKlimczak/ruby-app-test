# frozen_string_literal: true

require './lib/log_parser'
require './lib/web_page'

RSpec.describe LogParser do
  let(:log_parser) { LogParser.new('./spec/fixtures/webserver.log') }

  it 'returns array of WebPage' do
    expect(log_parser.run.first).to be_a(WebPage)
  end

  it 'returns correct number of webpages logs' do
    expect(log_parser.run.count).to eq(6)
  end
end
