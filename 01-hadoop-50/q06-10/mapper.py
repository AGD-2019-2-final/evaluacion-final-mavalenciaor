import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#

if __name__ == "__main__":
    for line in sys.stdin:
        line = line.strip()
        line_s = line.split("   ")
        sys.stdout.write("{}\t{}\n".format(line_s[0], line_s[2]))
