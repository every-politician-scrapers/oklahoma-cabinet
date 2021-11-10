#!/bin/env ruby
# frozen_string_literal: true

require 'every_politician_scraper/scraper_data'
require 'pry'

class MemberList
  class Member
    def name
      Name.new(
        full: noko.css('p').text,
        prefixes: %w[Lieutenant Governor General],
      ).short
    end

    def position
      noko.css('h2').text
    end

    private

    def text_nodes
      noko.css('.card-body').xpath('.//text()')
    end
  end

  class Members
    def member_container
      noko.css('.card .cmp-card__heading')
    end
  end
end

file = Pathname.new 'html/official.html'
puts EveryPoliticianScraper::FileData.new(file).csv
