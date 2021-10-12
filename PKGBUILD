# Maintainer: Jared Forrest <jared@jaredforrest.xyz>

pkgname=hnotify-utils
pkgver=0.1.0.0
pkgrel=1
pkgdesc="Simple haskell notification utilities"
url="https://github.com/jaredforrest/${pkgname}"
license=('GPL3')
arch=('x86_64')
depends=(
  'ghc'
  'ghc-libs'
  'haskell-fdo-notify'
)
source=(
  "${url}/archive/v${pkgver}.tar.gz"
)
sha256sums=(
  'SKIP'
)

prepare() {
  cd "${pkgname}-${pkgver}"
}

build() {
  cd "${pkgname}-${pkgver}"

  runhaskell Setup configure -O \
    --enable-shared \
    --enable-executable-dynamic \
    --disable-library-vanilla \
    --prefix="/usr" \
    --docdir="/usr/share/doc/${pkgname}" \
    --enable-tests \
    --dynlibdir="/usr/lib" \
    --libsubdir=\$compiler/site-local/\$pkgid \
    #--datasubdir="${pkgname}" \
    #--ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
    #--ghc-option='-pie' \

  runhaskell Setup build
  #runhaskell Setup register --gen-script
  #runhaskell Setup unregister --gen-script
  #sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
  #sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
  cd "${pkgname}-${pkgver}"

  #install -D -m744 register.sh "${pkgdir}/usr/share/haskell/register/${pkgname}.sh"
  #install -D -m744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${pkgname}.sh"
  runhaskell Setup copy --destdir="${pkgdir}"
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}

