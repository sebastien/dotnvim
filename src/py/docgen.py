import re, sys

BLOCK_START = re.compile("\\{\\{\\{")
BLOCK_END   = re.compile("\\}\\}\\}")
TEXT        = re.compile('^(\s*"\s?)(.*)$')
DIRECTIVE   = re.compile("\s*\"\s*@(keymap|command)\s+(.*)$")

class Extractor(object):

	def __init__( self ):
		self.mode = None

	def process( stream ):
		self.mode = None
		for line in stream.readlines()
			yield processLine(line)

	def processLine( line )
		m = DIRECTIVE.match(line)
		if m:
			yield from self.processDirective( self,  m.group(1), m.group(2))
		else:
			yield line

if __name__ == "__main__":
	e = Extractor()
	for path in sys.argv[1:]
		with open(path, 't') as f:
			e.process(f)

# EOF
