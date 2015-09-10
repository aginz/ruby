require 'httparty'
require 'nokogiri'

class Play

  # Initalize with parsed MacBeth play
  def initialize
    response = HTTParty.get("http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml")
    @play = Nokogiri::XML(response.body)
  end

  # Parse through speeches. Speech array contains speaker name + lines
  def speech
    speech_array = @play.xpath('//SPEECH').map do |node|
      node.children.map do |n|
        n.text
      end
    end
    speech_array
  end

  # Removes all "/n" from speech array
  def normalize_speech
    speech_array = speech.each do |n|
      n.delete("\n")
    end
    speech_array
  end

  # Finds all unique speakers in an array
  def speaker
    speaker_array = @play.xpath('//SPEAKER').map do |node|
      node.text
    end
    speaker_array.uniq
  end

  # Creates an array of hashes that counts each speakers' lines for each speech
  def line_counter
    result = []
    speaker.each do |speaker|
      normalize_speech.each do |lines|
        if lines.include? speaker
          result << { speaker => (lines.count - 1) } #Subtract 1 from speaker array to exclude speaker name
        end
      end
    end
    result
  end

  # Displays total number of lines for each speaker
  def results
    speaker.each do |speaker|
      counter = 0
      line_counter.each do |n|
        if n.keys.first == speaker
          counter += n.values.first
        end
      end
      puts "#{speaker} has #{counter} lines."
    end
  end
end

p = Play.new
p.results
