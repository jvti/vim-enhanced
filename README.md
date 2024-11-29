
# Vim Configuration

This repository contains a custom `.vimrc` configuration file designed to enhance the efficiency and user experience of Vim. The configuration includes optimized settings, useful plugins, and tailored key mappings for a seamless development environment.

## Features

- **Basic Settings**: 
  - Line numbers with relative numbering.
  - Incremental search with highlighted matches.
  - UTF-8 encoding for compatibility.
  - Syntax highlighting and automatic indentation.

- **Tabs and Indentation**:
  - Tabs are set to 4 spaces.
  - Automatic conversion of tabs to spaces.

- **Performance Enhancements**:
  - Hidden buffers to allow seamless switching.
  - History and undo levels increased to 1000.
  - Visual and error bells disabled.

- **File Management**:
  - No backup, write backup, or swap files.
  - Persistent undo support.

- **Appearance**:
  - True color support (`termguicolors`).
  - Folding enabled based on indentation.

## Plugin Manager: vim-plug

This configuration uses [vim-plug](https://github.com/junegunn/vim-plug) to manage plugins. Ensure you have vim-plug installed before proceeding.

### Plugins Included

1. **Syntax Highlighting**: Syntax support for various programming languages.
2. **Additional Plugins**: Add your plugins in the `plug#begin` section of `.vimrc`.

## Installation

### Step 1: Clone the Repository
```bash
git clone https://github.com/yourusername/your-repo-name.git
cd your-repo-name
```

### Step 2: Backup Your Existing Configuration
If you already have a `.vimrc` file, back it up:
```bash
cp ~/.vimrc ~/.vimrc.backup
```

### Step 3: Copy the Configuration
Copy the provided `.vimrc` file to your home directory:
```bash
cp .vimrc ~/.vimrc
cp -r .skeletons ~
```

### Step 4: Install vim-plug
Download and install vim-plug if you haven't already:
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### Step 5: Install Plugins
Open Vim and run:
```vim
:PlugInstall
```

## Customization

Feel free to modify the `.vimrc` file to suit your preferences. Key areas to consider:
- **Plugins**: Add or remove plugins in the `plug#begin` section.
- **Key Mappings**: Adjust mappings for your workflow.

## Contribution

If you have suggestions or improvements, feel free to open an issue or submit a pull request.

