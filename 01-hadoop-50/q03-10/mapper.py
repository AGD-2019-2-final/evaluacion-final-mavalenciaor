import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":

    for line in sys.stdin:
        
        line = line.strip( )
        vals = line.split(",")
        letter = vals[0]
        value = vals[1]
        print("%s\t%s" %(value, letter))