# frozen_string_literal: true

require './lib/web_page'

RSpec.describe WebPage do
  let(:web_page) { WebPage.new('/home') }

  it 'has correct address' do
    expect(web_page.address).to eq('/home')
  end

  context 'when there are two unique visits' do
    before do
      5.times { web_page.add_visit('123.0.0.1') }
      2.times { web_page.add_visit('123.0.0.2') }
    end

    describe '#visits_count' do
      it 'returns correct number of visits' do
        expect(web_page.visits_count).to eq(7)
      end
    end

    describe '#unique_visits_count' do
      it 'returns correct number of unique visits' do
        expect(web_page.unique_visits_count).to eq(2)
      end
    end
  end
end
