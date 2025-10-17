# libasm

A library that reimplements essential C standard library functions in x86-64 assembly language.

## Description

This project is an implementation of commonly used C library functions written entirely in x86-64 assembly language using NASM syntax. The library provides assembly versions of string manipulation, I/O, and memory allocation functions that are compatible with their standard C counterparts.

This is a **42 School** project focused on learning low-level assembly programming and understanding how standard library functions work at the machine code level.

## Functions Implemented

| Function | Description | Equivalent C Function |
|----------|-------------|----------------------|
| `ft_strlen` | Calculate the length of a string | `strlen()` |
| `ft_strcpy` | Copy a string to another buffer | `strcpy()` |
| `ft_strcmp` | Compare two strings lexicographically | `strcmp()` |
| `ft_write` | Write data to a file descriptor | `write()` |
| `ft_read` | Read data from a file descriptor | `read()` |
| `ft_strdup` | Duplicate a string in heap memory | `strdup()` |

## Project Structure

```
libasm/
├── includes/
│   └── libasm.h          # Header file with function prototypes
├── srcs/
│   ├── ft_strlen.s       # String length calculation
│   ├── ft_strcpy.s       # String copy
│   ├── ft_strcmp.s       # String comparison
│   ├── ft_write.s        # Write system call wrapper
│   ├── ft_read.s         # Read system call wrapper
│   └── ft_strdup.s       # String duplication with malloc
├── main.c                # Test program demonstrating all functions
├── Makefile              # Build configuration
└── README.MD             # This file
```

## Requirements

- **NASM** (Netwide Assembler) for x86-64
- **GCC** or compatible C compiler
- **GNU Make**
- **Linux** x86-64 system (uses Linux system calls)

## Installation

### Install Dependencies (Ubuntu/Debian)
```bash
sudo apt update
sudo apt install nasm gcc make
```

### Install Dependencies (Arch Linux)
```bash
sudo pacman -S nasm gcc make
```

## Building

### Build the static library
```bash
make
```

This creates `libasm.a` static library file.

### Build and run the test program
```bash
make run
```

### Build test program only
```bash
make compile
```

### Clean build files
```bash
make clean      # Remove object files
make fclean     # Remove all generated files
```

## Usage

### In Your C Program

1. Include the header:
```c
#include "libasm.h"
```

2. Compile with the library:
```bash
gcc your_program.c libasm.a -o your_program
```

### Example Usage

```c
#include "libasm.h"
#include <stdlib.h>

int main(void) {
    const char *str = "Hello, World!";
    char buffer[50];
    char *duplicate;
    
    // Get string length
    size_t len = ft_strlen(str);
    
    // Copy string
    ft_strcpy(buffer, str);
    
    // Compare strings
    int cmp = ft_strcmp(str, buffer);
    
    // Write to stdout
    ft_write(1, str, len);
    ft_write(1, "\n", 1);
    
    // Duplicate string
    duplicate = ft_strdup(str);
    
    // Clean up
    free(duplicate);
    
    return 0;
}
```

## Function Details

### `size_t ft_strlen(const char *str)`
- **Purpose**: Calculate the length of a null-terminated string
- **Parameters**: `str` - pointer to the string
- **Returns**: Number of characters before the null terminator
- **Notes**: Does not count the null terminator

### `char *ft_strcpy(char *dst, const char *src)`
- **Purpose**: Copy a string from source to destination
- **Parameters**: 
  - `dst` - destination buffer (must be large enough)
  - `src` - source string to copy
- **Returns**: Pointer to destination string
- **Notes**: Copies including the null terminator

### `int ft_strcmp(const char *s1, const char *s2)`
- **Purpose**: Compare two strings lexicographically
- **Parameters**: 
  - `s1` - first string to compare
  - `s2` - second string to compare
- **Returns**: 
  - `< 0` if s1 < s2
  - `0` if s1 == s2
  - `> 0` if s1 > s2

### `ssize_t ft_write(int fd, const void *buf, size_t count)`
- **Purpose**: Write data to a file descriptor
- **Parameters**:
  - `fd` - file descriptor (1 for stdout, 2 for stderr)
  - `buf` - buffer containing data to write
  - `count` - number of bytes to write
- **Returns**: Number of bytes written, or -1 on error

### `ssize_t ft_read(int fd, void *buf, size_t count)`
- **Purpose**: Read data from a file descriptor
- **Parameters**:
  - `fd` - file descriptor (0 for stdin)
  - `buf` - buffer to store read data
  - `count` - maximum number of bytes to read
- **Returns**: Number of bytes read, or -1 on error

### `char *ft_strdup(const char *str)`
- **Purpose**: Create a duplicate of a string in heap memory
- **Parameters**: `str` - string to duplicate
- **Returns**: Pointer to new string, or NULL on allocation failure
- **Notes**: Uses `malloc()`, caller must `free()` the result

## Technical Details

- **Architecture**: x86-64 only
- **Assembler**: NASM (Netwide Assembler)
- **Calling Convention**: System V AMD64 ABI
- **System Calls**: Uses Linux system calls for I/O operations
- **Memory Management**: `ft_strdup` uses libc `malloc()`

## Testing

The included test program (`main.c`) demonstrates all implemented functions:

```bash
make run
```

This will:
1. Test string length calculation
2. Demonstrate string copying
3. Show string comparison with different inputs
4. Test interactive input/output
5. Demonstrate string duplication

## Development

### Adding New Functions

1. Create a new `.s` file in `srcs/`
2. Add the function prototype to `includes/libasm.h`
3. The Makefile will automatically include new source files

### Debugging

Use the provided debug targets:
```bash
make compile    # Build with debug symbols
make v          # Run with Valgrind
```

## License

This project is part of the 42 School curriculum, focusing on low-level assembly programming and system calls.

## Author

**goncalo1021pt** - Created as part of the 42 School libasm project (October 2025)