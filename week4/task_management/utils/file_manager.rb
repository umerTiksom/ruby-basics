# class use to read and write date from the file
require 'json'
class FileManager
  def self.write_json(path, data)
    File.write(path, JSON.pretty_generate(data))
  end

  def self.read_json(path)
    return [] unless File.exist?(path)

    content = File.read(path)
    return [] if content.strip.empty?

    JSON.parse(content)
  end
end
