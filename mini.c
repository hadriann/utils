#include <stdio.h>
#include <ctype.h>

struct {
    int
        in_line_comment,
        in_block_comment,
        in_single_string,
        in_double_string,
        in_space,
        in_regex;
} flag;

int find(int a, int v[])
{
    int i, len;
    len = sizeof(v) / sizeof(v[0]);

    for (i = 0; i < len; i++)
        if (a == v[i])
            return 1;
    return 0;
}

static inline int in_comment()
{
    return flag.in_line_comment || flag.in_block_comment;
}

static inline int in_string()
{
    return flag.in_single_string || flag.in_double_string;
}

static inline int in_regex()
{
    return flag.in_regex != 0;
}

static inline int in_special_context()
{
    return in_comment() || in_string() || in_regex();
}

/**
 * @return 1 for success, 0 otherwise
 */
int usage(int argc)
{
    if (argc != 2)
        return 0;
    else
        return 1;
}

void process(FILE* f)
{
    int c, pc, nc, nonspace, skip;

    pc = nc = nonspace = 0;

    while ((c = getc(f)) != EOF) {
        // peek at the next character
        nc = getc(f);
        ungetc(nc, f);

        // reset the skip flag
        skip = 0;


        // detect line comments
        if (!in_special_context() && c == '/' && nc == '/') {
            flag.in_line_comment = 1;
        }
        else if (flag.in_line_comment && c == 10) {
            flag.in_line_comment = 0;
            skip = 1;
        }

        // detect block comments
        if (!in_special_context() && c == '/' && nc == '*') {
            flag.in_block_comment = 1;
        }
        else if (flag.in_block_comment && c == '/' && pc == '*') {
            flag.in_block_comment = 0;
            skip = 1;
        }

        // detect strings in single quotes
        if (!in_special_context() && c == '\'') {
            flag.in_single_string = 1;
        }
        else if (flag.in_single_string && pc != '\\' && c == '\'') {
            flag.in_single_string = 0;
        }

        // detect strings in double quoutes
        if (!in_special_context() && c == '"') {
            flag.in_double_string = 1;
        }
        else if (flag.in_double_string && pc != '\\' && c == '"') {
            flag.in_double_string = 0;
        }

        // detect multiple white spaces
        if (!in_special_context() && isspace(c) && isspace(pc)) {
            flag.in_space = 1;
        }
        else {
            flag.in_space = 0;
        }

        // detect skippable characters
        if (!in_special_context() && isspace(c) && (ispunct(pc) || ispunct(nc))) {
            skip = 1;
        }

        // enforce unskippable characters
        if (!in_special_context() && isspace(c) && pc == '}') {
            skip = 0;
        }

        // detect regex literals
        if (!in_special_context() && c == '/' && ispunct(nonspace)) {
            flag.in_regex = 1;
        }
        else if (flag.in_regex == 1 && c == '/' && pc != '\\') {
            flag.in_regex = 2;
            puts("S");
        }
        else if (flag.in_regex == 2 && !isalpha(c)) {
            flag.in_regex = 0;
            puts("ZZZ");
        }

        if (!skip && !in_comment() && !flag.in_space) {
            putchar(c);
        }

        if (!isspace(c)) {
            nonspace = c;
        }
        pc = c;
    }
}

int main(int argc, char* argv[])
{
    if (!usage(argc)) {
        puts("You need to specify a valid file name as the first argument.");
        return 1;
    }

    int ok;
    char* filename = argv[1];
    FILE* f = fopen(filename, "r");

    if (f) {
        process(f);
        puts("");
        fclose(f);
        ok = 0;
    }
    else {
        puts("Unable to read the input file.");
        ok = 1;
    }

    return ok;
}
