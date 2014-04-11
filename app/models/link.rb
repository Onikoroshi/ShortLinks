require 'securerandom'

class Link < ActiveRecord::Base
  validates :in_url, :out_url, uniqueness: true

  def create_short
    return if out_url.nil? || out_url.empty?
    self.in_url = generate_short
  end

  private

  def generate_short
    hex_length = 3
    random_try = SecureRandom.hex(hex_length)
    puts "trying " + random_try
    already_there = Link.pluck(:in_url)
    while already_there.include? random_try
      random_try = SecureRandom.hex(hex_length)
      puts "trying " + random_try
    end
    puts "chose " + random_try
    random_try
  end
end
