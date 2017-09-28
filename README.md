# cps · create file copy with given suffix

## Usage

Pass a **source file** and a filename **suffix** for the copied target.

```bash
$ cps foo.pdf -bar
$ ls

foo.pdf
foo-bar.pdf
```

## What happens inside

After building the target file name, a simple copy command is used: `cp file.pdf file_suffix.pdf`.

