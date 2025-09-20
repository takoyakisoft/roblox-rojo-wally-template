import os

# --- Settings ---
# List of directories to process
TARGET_DIRECTORIES = [
    'Packages',
    'ServerPackages',
    'src'
]

# List of required headers
REQUIRED_HEADERS = [
    '--!native',
    '--!optimize 2'
]
# ----------------

def add_missing_headers_to_file(file_path):
    """
    Adds only the missing required headers to the specified file.
    All lines in the file are checked.
    """
    try:
        with open(file_path, 'r+', encoding='utf-8') as f:
            content = f.readlines()

            existing_headers_set = {line.strip() for line in content}

            headers_to_add = []
            for header in REQUIRED_HEADERS:
                if header not in existing_headers_set:
                    headers_to_add.append(header)

            if not headers_to_add:
                print(f'Skipped (all required headers exist): {file_path}')
                return

            new_header_lines = [f'{header}\n' for header in headers_to_add]
            new_content = new_header_lines + content
            f.seek(0)
            f.writelines(new_content)
            f.truncate()

            print(f'Added {headers_to_add} to: {file_path}')

    except Exception as e:
        print(f'Error processing {file_path}: {e}')

def process_directory(directory):
    """
    Recursively processes the specified directory and adds headers to script files.
    """
    if not os.path.isdir(directory):
        print(f'Info: Directory "{directory}" not found, skipping.')
        return

    print(f'\n--- Processing directory: {directory} ---')
    for root, _, files in os.walk(directory):
        for file in files:
            if file.endswith(('.lua', '.luau')):
                add_missing_headers_to_file(os.path.join(root, file))

if __name__ == '__main__':
    for dir_path in TARGET_DIRECTORIES:
        process_directory(dir_path)
    print('\n--- All processing finished. ---')