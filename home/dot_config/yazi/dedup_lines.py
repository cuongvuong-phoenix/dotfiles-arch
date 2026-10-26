import sys

if len(sys.argv) < 2:
    print("Usage: python dedup_lines.py <file1> [file2 ...]")
    sys.exit(1)

for file_path in sys.argv[1:]:
    try:
        with open(file_path, "r", encoding="utf-8") as f:
            # dict.fromkeys() preserves order and removes duplicates on stripped lines
            unique_lines = [line + "\n" for line in dict.fromkeys(line.rstrip("\r\n") for line in f)]

        with open(file_path, "w", encoding="utf-8") as f:
            f.writelines(unique_lines)

        print(f"Successfully processed: '{file_path}'")
    except FileNotFoundError:
        print(f"Error: File '{file_path}' not found.", file=sys.stderr)
    except Exception as e:
        print(f"Error processing '{file_path}': {e}", file=sys.stderr)
