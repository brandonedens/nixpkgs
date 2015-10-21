{ stdenv, fetchurl, python, buildPythonPackage, gmp }:

buildPythonPackage rec {
  name = "pyelftools-0.23";
  namePrefix = "";

  src = fetchurl {
    url = "http://pypi.python.org/packages/source/p/pyelftools/${name}.tar.gz";
    sha256 = "1pi1mdzfffgl5qcz0prsa7hlbriycy7mgagi0fdrp3vf17fslmzw";
  };

  buildInputs = stdenv.lib.optional (!python.isPypy or false) gmp; # optional for pypy

  doCheck = !(python.isPypy or stdenv.isDarwin); # error: AF_UNIX path too long

  meta = {
    homepage = "http://github.com/eliben/pyelftools";
    description = "Library for analyzing ELF files and DWARF debugging information";
    license = stdenv.lib.licenses.publicDomain;
    maintainers = [ stdenv.lib.maintainers.mbe ];
    platforms = stdenv.lib.platforms.unix;
  };
}
