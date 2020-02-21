import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#

if __name__ == "__main__":

    for line in sys.stdin:
        line = line.strip()
        let, dat, key_b = line.split("   ")
        key_a = len(key_b)
        sys.stdout.write("{}\t{}\t{}\t{}\n".format(key_a, key_b, dat, let))