# fasm directives
## format
- `format` directive is specifies the format of output file. The
primary formats are available for generating raw binaries, object files,
and executable files for different operating systems.
The specific "format" types in fasm for x86 are:
- `format binary`: creates a flat "raw" binary file. This can be
used for simple programs, boot sectors, or MS-DOS `.COM` executables/
`.SYS` drivers.
- `format elf`: generates ELF files, which are commonly used on linux
and other unix-like systems. This format is available for both 32-bit
and 64-bit targets (e.g., `format elf little`, `format elf64` in 
some contexts).
- `format pe`: produces PE files, the standard format for windows
executables, DLLs, and WDM drivers. This format can target both
32-bit and 64-bit windows (e.g., `format pe`, `format pe gui`,
`format pe console`, `format pe64` in some contexts).
- `format coff`: creates COFF files (both classic and MS-DOS spec
ific variations), which are object files used by variaous link
ers, particulary on windows platforms.
- `format mz`: generates MS-DOS MZ executable files, which can
include a custom DOS stub.
- `format obj`: while not explicitly detailed as a top-level format in
the search snippets, COFF and potentially other object file type
cover the general "object file" need for linking purposes.
```bash
syntax:
format format name
```
## use16
- `use16` is switching code to 16-bit until next "use32/64" instruction.
## use32
- `use32` is switching code to 32-bit until next "use16/64" instruction.
