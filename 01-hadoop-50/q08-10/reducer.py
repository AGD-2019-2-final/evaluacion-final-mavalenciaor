import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':

    curkey = None
    tot_sum = 0
    tot_cont = 0

    for line in sys.stdin:

        key, val, cont = line.split("\t")
        val = float(val)
        cont = float(cont)

        if key == curkey:
            tot_sum += val
            tot_cont += cont

        else: 

            if curkey is not None:

                sys.stdout.write("{}\t{}\t{}\n".format(curkey, float(tot_sum), tot_sum / tot_cont ))

            curkey = key
            tot_sum = val
            tot_cont = cont
        
    sys.stdout.write("{}\t{}\t{:.3f}...\n".format(curkey, float(tot_sum), tot_sum / tot_cont))