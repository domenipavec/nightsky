#!/usr/bin/env python

import inkex
import sys


def pxtomm(s):
    return s/90.0*25.4


def tx(s):
    return str(pxtomm(float(s))-25.07)


def ty(s):
    return str(220.95-pxtomm(1052.36-float(s)))


class TemplateEffect(inkex.Effect):
    def __init__(self):
        # Call base class construtor.
        inkex.Effect.__init__(self)

    def effect(self):
        # Loop through all the selected items in Inkscape
        for id, node in self.selected.iteritems():
            # Check if the node is a path ( "svg:path" node in XML )
            if node.tag == inkex.addNS('circle', 'svg'):
                sys.stderr.write(tx(node.get('cx')))
                sys.stderr.write(',')
                sys.stderr.write(ty(node.get('cy')))
                sys.stderr.write('\n')


# Create effect instance and apply it.
effect = TemplateEffect()
effect.affect()
