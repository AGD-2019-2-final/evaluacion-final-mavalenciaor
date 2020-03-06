import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#

if __name__ == "__main__":

    for line in sys.stdin:
        line = line.strip()
        let, dat, numb = line.split("   ") 
        sys.stdout.write("{}\t{}\t{}\n".format(dat, let, numb))