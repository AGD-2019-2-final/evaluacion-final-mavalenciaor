import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#

if __name__ == '__main__':

    curkey = None

    for line in sys.stdin:

        line = line.strip()

        key, aux, val = line.split("\t")

        if key == curkey:
            fin_line = fin_line + val + ","

        else: 

            if curkey is not None:
                fin_line = fin_line[:-1]
                sys.stdout.write("{}\n".format(fin_line))

            fin_line = key+"\t"+val+","
            curkey = key
    
    fin_line = fin_line[:-1]
    sys.stdout.write("{}\n".format(fin_line))