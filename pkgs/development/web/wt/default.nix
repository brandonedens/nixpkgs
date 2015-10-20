{ stdenv, fetchurl, cmake, boost, graphicsmagick, libharu, pango, zlib }:

stdenv.mkDerivation rec {
  name = "wt-3.3.4";

  src = fetchurl {
    url = "http://downloads.sourceforge.net/witty/wt-3.3.4.tar.gz";
    sha256 = "046ykvwnimkmwffqdqxcm3xviizg4cd1v3rczbrf6rj3a1j9qzrj";
  };

  buildInputs = [ boost cmake graphicsmagick libharu pango zlib ];

  meta = {
    description = "A C++ library and application server for developing and deploying web applications";
    homepage = "http://www.webtoolkit.eu/";
    license = stdenv.lib.licenses.gpl2;
    maintainers = "brandonedens@gmail.com";
    platforms = with stdenv.lib.platforms; linux;
  };
}
