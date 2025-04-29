# File Sorter

**File Sorter** is a Ruby-based utility that monitors a specified directory—such as your Downloads folder—and automatically organizes incoming files into subfolders. It uses file extension rules and keyword-based overrides to ensure that files are neatly categorized as soon as they arrive. This script is perfect for streamlining your workflow and keeping your data organized.

## Features

- **Real-Time Monitoring:** Uses the [Listen](https://github.com/guard/listen) gem to track new files in real time.
- **File Type Categorization:** Automatically sorts files into destination folders based on file extensions (e.g., images, documents, videos).
- **Keyword-Based Overrides:** Adjusts the destination folder if the filename contains specific keywords (e.g., "forblender" for Blender projects).
- **Cross-Platform:** Built with Ruby so it works on multiple systems; optimized for Windows with optional native adapters like `wdm`.
- **Customizable:** Easily extend or modify the sorting rules by editing the configuration in the script.

## Technologies

- **Ruby** – A dynamic programming language used for building the application.
- **Listen Gem** – Monitors file system events to trigger file sorting.
- **FileUtils** – Provides methods for file manipulation.

## Requirements

- **Ruby 3.x or later** – Ensure Ruby is installed on your machine.
- **Gems:**
  - `listen` (for monitoring file changes)
  - *Optional:* `wdm` (improves performance on Windows)

## Installation

1. **Install Ruby:**  
   Download and install Ruby from the [official Ruby website](https://www.ruby-lang.org/en/downloads/) or via [RubyInstaller for Windows](https://rubyinstaller.org) (for Windows users).

2. **Clone or Download the Repository:**  
   Clone this repository to your local machine:
   ```bash
   git clone https://github.com/WhiteurstJoshua/file-sorter-ruby.git
   cd file-sorter

