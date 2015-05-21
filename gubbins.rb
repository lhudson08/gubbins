require 'formula'

class Gubbins < Formula
  homepage 'https://github.com/sanger-pathogens/gubbins'
  url 'https://github.com/sanger-pathogens/gubbins/archive/v1.3.4.tar.gz'
  sha1 '3b47c6fd28040a1632d417cb941ae86668f23bf4'
  head 'https://github.com/sanger-pathogens/gubbins.git'

  depends_on :autoconf
  depends_on :automake
  depends_on :libtool
  depends_on 'raxml'
  depends_on 'fasttree'
  depends_on 'fastml2'
  depends_on :python
  
  depends_on LanguageModuleDependency.new :python, "biopython", "Bio"
  
  def install
    inreplace "src/Makefile.am", "-lrt", "" if OS.mac? # no librt for osx
    inreplace "configure.ac", "PKG_CHECK_MODULES([zlib], [zlib])", "AC_CHECK_LIB(zlib, zlib)" if OS.mac?
    inreplace "python/Makefile.am", "--root=$(DESTDIR)", "--root=#{prefix}" if OS.mac?
    
    system "cat python/Makefile.am"
    system "autoreconf -i"
    system "./configure",
           "--disable-debug",
           "--disable-dependency-tracking",
           "--prefix=#{prefix}"

    system "make","install"
  end

  test do
    system "gubbins"
    system "run_gubbins.py"
  end
end
