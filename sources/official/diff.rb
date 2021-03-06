#!/bin/env ruby
# frozen_string_literal: true

require 'every_politician_scraper/comparison'

# Process the data from each source before comparison
class Comparison < EveryPoliticianScraper::DecoratedComparison
  def wikidata_csv_options
    { converters: [->(val) { val.to_s.upcase.gsub(/^OKLAHOMA /, '') }] }
  end
end

diff = Comparison.new('wikidata.csv', 'scraped.csv').diff
puts diff.sort_by { |r| [r.first, r[1].to_s] }.reverse.map(&:to_csv)
