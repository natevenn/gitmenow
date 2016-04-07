require 'nokogiri'
require 'open-uri'
#require 'rest-client'

module Scraper

  def all_contribution_numbers
    page = Nokogiri::HTML(open("https://github.com/#{self.screen_name}"))
    page.css("span.contrib-number")
  end

  def number_of_contributions_last_year
    all_contribution_numbers[0].text
  end

  def longest_streak
    all_contribution_numbers[1].text
  end

  def current_streak
    all_contribution_numbers[2].text
  end

  def time_frames_last_year
    page = Nokogiri::HTML(open("https://github.com/#{self.screen_name}"))
    page.xpath('//*[@id="contributions-calendar"]/div[3]/span[3]').text
  end


  def time_frames_longest_streak
    page = Nokogiri::HTML(open("https://github.com/#{self.screen_name}"))
    page.xpath('//*[@id="contributions-calendar"]/div[4]/span[3]').text
  end

  def time_frames_current_streak
    page = Nokogiri::HTML(open("https://github.com/#{self.screen_name}"))
    page.xpath('//*[@id="contributions-calendar"]/div[5]/span[3]').text
  end
end
