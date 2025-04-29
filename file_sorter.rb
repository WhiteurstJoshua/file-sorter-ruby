require 'fileutils'
require 'listen'

# Define your downloads directory (modify this path as needed)
DOWNLOADS_DIR = "C:/Users/jaywh/Downloads"

# Define destination folders based on file extensions.
SORTED_DIRS = {
  "Blender"   => [".blend", ".png", ".jpg"],
  "GitHub"    => [".git", ".py", ".md"],
  "DaVinci"   => [".drp", ".mov", ".xml"],
  "Images"    => [".jpg", ".png", ".jpeg", ".gif"],
  "Documents" => [".pdf", ".docx", ".txt"]
}

# Special keywords that override the default sorting.
SPECIAL_KEYWORDS = {
  "Blender" => ["forblender", "forblndr"],
  "GitHub"  => ["repo", "github"],
  "DaVinci" => ["resolve", "davinci"]
}

# Set up a listener to monitor the downloads directory
listener = Listen.to(DOWNLOADS_DIR, only: /\.(blend|png|jpg|git|py|md|drp|mov|xml|jpeg|gif|pdf|docx|txt)$/i) do |modified, added, removed|
  added.each do |filepath|
    next if File.directory?(filepath)
    filename = File.basename(filepath)
    ext = File.extname(filename).downcase

    # Determine the default folder based on file extension.
    folder = nil
    SORTED_DIRS.each do |key, exts|
      if exts.include?(ext)
        folder = key
        break
      end
    end

    # Skip files that don’t match
    next unless folder

    # Override destination if specific keywords are found in the filename.
    SPECIAL_KEYWORDS.each do |target_folder, keywords|
      if keywords.any? { |keyword| filename.downcase.include?(keyword) }
        folder = target_folder
        break
      end
    end

    destination = File.join(DOWNLOADS_DIR, folder)
    FileUtils.mkdir_p(destination) unless Dir.exist?(destination)
    begin
      FileUtils.mv(filepath, destination)
      puts "Moved #{filename} to #{destination}"
    rescue => e
      puts "Error moving #{filename}: #{e.message}"
    end
  end
end

puts "Monitoring #{DOWNLOADS_DIR} for new files..."
listener.start
sleep
